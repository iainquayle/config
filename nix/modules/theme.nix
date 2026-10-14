# exposes propagate/values.toml as THEME_<SECTION>_<KEY> session vars, read at runtime (eg hypr/hyprland.lua)
{ lib, ... }:
let
  values = builtins.fromTOML (builtins.readFile ../../propagate/values.toml);
  envName = section: key: lib.toUpper "THEME_${section}_${key}";
in {
  environment.sessionVariables = lib.concatMapAttrs
    (section: lib.mapAttrs' (key: value: lib.nameValuePair (envName section key) (toString value)))
    values;
}
