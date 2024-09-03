{packages, ...}: {
  config,
  lib,
  ...
}: let
  cfg = config.services.python-validity;
in {
  options.services.python-validity.enable =
    lib.mkEnableOption "python-validity driver for fingerprints";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      packages.x86_64-linux.python-validity
    ];

    systemd.packages = [packages.x86_64-linux.python-validity];
    systemd.services.python3-validity.wantedBy = ["multi-user.target"];

    # need to register the dbus configuration files of the package, otherwise we will get access errors
    services.dbus.packages = [packages.x86_64-linux.python-validity];
  };
}
