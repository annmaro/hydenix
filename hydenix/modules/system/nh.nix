{
  config,
  lib,
  ...
}:

let
  cfg = config.hydenix.nh;
in
{
  options.hydenix.nh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable nh module";
    };
  };

  config = lib.mkIf cfg.enable {
    nh = {
        clean = {
        enable = true;
        extraArgs = "--keep-since 2d --keep 2";
      };
      flake = "/home/${username}/nixos-config/defualt";
    };
  };
}
