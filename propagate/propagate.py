#!/usr/bin/env python3
"""Config propagation tool — renders Mako templates using values.toml + optional machine overrides."""

import argparse
import os
import subprocess
import sys
import tomllib
from pathlib import Path

from mako.template import Template

REPO_ROOT = Path(__file__).parent.parent.resolve()
PROPAGATE_DIR = Path(__file__).parent.resolve()
VALUES_FILE = PROPAGATE_DIR / "values.toml"
GITIGNORE_FILE = REPO_ROOT / ".gitignore"
SKIP_DIRS = {".git", "propagate", "node_modules", "venv", "__pycache__"}


class Namespace:
    """Recursively wraps a dict for dot-access in Mako templates."""
    def __init__(self, data: dict):
        for k, v in data.items():
            setattr(self, k, Namespace(v) if isinstance(v, dict) else v)

    def __repr__(self):
        return repr(vars(self))


def deep_merge(base: dict, override: dict) -> dict:
    result = dict(base)
    for k, v in override.items():
        if k in result and isinstance(result[k], dict) and isinstance(v, dict):
            result[k] = deep_merge(result[k], v)
        else:
            result[k] = v
    return result


def load_values() -> dict:
    with open(VALUES_FILE, "rb") as f:
        values = tomllib.load(f)
    override_path = os.environ.get("PROPAGATE_OVERRIDES")
    if override_path:
        p = Path(override_path)
        if p.exists():
            with open(p, "rb") as f:
                values = deep_merge(values, tomllib.load(f))
        else:
            print(f"Warning: PROPAGATE_OVERRIDES set but file not found: {p}", file=sys.stderr)
    return values


def find_templates() -> list[Path]:
    templates = []
    for dirpath, dirnames, filenames in os.walk(REPO_ROOT):
        dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS]
        for name in filenames:
            if name.endswith(".mako"):
                templates.append(Path(dirpath) / name)
    return sorted(templates)


def render_target(template: Path) -> Path:
    return template.with_suffix("")  # strip .mako


def gitignore_lines() -> list[str]:
    if not GITIGNORE_FILE.exists():
        return []
    return GITIGNORE_FILE.read_text().splitlines()


def entry_in_gitignore(entry: str, lines: list[str]) -> bool:
    return any(line.strip() == entry for line in lines)


def add_to_gitignore(entry: str) -> bool:
    """Append entry if not already present. Returns True if added."""
    lines = gitignore_lines()
    if entry_in_gitignore(entry, lines):
        return False
    with open(GITIGNORE_FILE, "a") as f:
        if lines and lines[-1] != "":
            f.write("\n")
        f.write(entry + "\n")
    return True


def remove_from_gitignore(entry: str) -> bool:
    """Remove exact entry from gitignore. Returns True if removed."""
    lines = gitignore_lines()
    new_lines = [l for l in lines if l.strip() != entry]
    if len(new_lines) == len(lines):
        return False
    GITIGNORE_FILE.write_text("\n".join(new_lines) + ("\n" if new_lines else ""))
    return True


def is_git_tracked(path: Path) -> bool:
    result = subprocess.run(
        ["git", "ls-files", "--error-unmatch", str(path)],
        cwd=REPO_ROOT,
        capture_output=True,
    )
    return result.returncode == 0


def git_rm_cached(path: Path) -> None:
    subprocess.run(
        ["git", "rm", "--cached", str(path)],
        cwd=REPO_ROOT,
        capture_output=True,
    )


def relative_to_root(path: Path) -> str:
    return str(path.relative_to(REPO_ROOT))


def cmd_render(args) -> None:
    values = load_values()
    ns = Namespace(values)
    templates = find_templates()
    if not templates:
        print("No .mako templates found.")
        return
    for tmpl in templates:
        target = render_target(tmpl)
        rendered = Template(filename=str(tmpl)).render(**vars(ns))
        target.write_text(rendered)
        entry = relative_to_root(target)
        added = add_to_gitignore(entry)
        if is_git_tracked(target):
            git_rm_cached(target)
            print(f"rendered + git rm --cached: {entry}")
        elif added:
            print(f"rendered + gitignore: {entry}")
        else:
            print(f"rendered: {entry}")


def cmd_clean(args) -> None:
    templates = find_templates()
    for tmpl in templates:
        target = render_target(tmpl)
        entry = relative_to_root(target)
        if target.exists():
            target.unlink()
            print(f"removed: {entry}")
        removed = remove_from_gitignore(entry)
        if removed:
            print(f"gitignore: removed {entry}")


def cmd_list(args) -> None:
    templates = find_templates()
    if not templates:
        print("No .mako templates found.")
        return
    for tmpl in templates:
        target = render_target(tmpl)
        print(f"{relative_to_root(tmpl)} -> {relative_to_root(target)}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Render Mako config templates.")
    sub = parser.add_subparsers(dest="command")
    sub.add_parser("render", help="Render all templates (default)")
    sub.add_parser("clean", help="Remove rendered files and gitignore entries")
    sub.add_parser("list", help="List templates and their targets")
    args = parser.parse_args()
    match args.command:
        case "clean":
            cmd_clean(args)
        case "list":
            cmd_list(args)
        case _:
            cmd_render(args)


if __name__ == "__main__":
    main()
