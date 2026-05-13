{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ente-auth
    ente-cli
    age
    (writeShellScriptBin "encrypt-archive" ''
      if [ $# -lt 1 ]; then
        echo "Usage: encrypt-archive <path> [output]" >&2
        exit 1
      fi
      src="$1"
      if [ ! -e "$src" ]; then
        echo "encrypt-archive: path not found: $src" >&2
        exit 1
      fi
      out="''${2:-$(basename "$src").tar.zst.age}"
      tar -c "$src" | zstd -T0 -19 --long | age -e -p > "$out"
    '')
    (writeShellScriptBin "decrypt-archive" ''
      if [ $# -lt 1 ]; then
        echo "Usage: decrypt-archive <input> [output-dir]" >&2
        exit 1
      fi
      src="$1"
      if [ ! -f "$src" ]; then
        echo "decrypt-archive: file not found: $src" >&2
        exit 1
      fi
      out="''${2:-.}"
      age -d < "$src" | zstd -d -T0 --long | tar x -C "$out"
    '')
  ];
}
