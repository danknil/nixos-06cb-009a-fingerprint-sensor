{packages, ...}: {
  config,
  lib,
  ...
}: let
  cfg = config.services.open-fprintd;
in {
  options.services.open-fprintd.enable = lib.mkEnableOption "Patched fprind";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [packages.x86_64-linux.fprintd-clients];

    systemd.packages = [packages.x86_64-linux.open-fprintd];

    # need to register the dbus configuration files of the package, otherwise we will get access errors
    services.dbus.packages = [packages.x86_64-linux.open-fprintd];

    # disable fprintd, since we are replacing it with open-fprintd and we are using the user executable of fprintd-clients
    services.fprintd.enable = false;
  };
}
