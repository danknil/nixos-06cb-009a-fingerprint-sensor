{packages, ...}: {
  config,
  lib,
  ...
}: let
  cfg = config.services.python-validity;
  inherit (packages.x86_64-linux) fprintd-clients open-fprintd python-validity;
in {
  options.services.python-validity.enable =
    lib.mkEnableOption "python-validity driver for fingerprints";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      fprintd-clients
      open-fprintd
      python-validity
    ];

    systemd.packages = [
      open-fprintd
      python-validity
    ];

    systemd.services = {
      open-fprintd.enable = true;
      python3-validity.enable = true;
    };

    # disable since we replace it with open-fprintd
    services.fprintd.enable = false;
  };
}
