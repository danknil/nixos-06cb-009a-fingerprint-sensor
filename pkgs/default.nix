{callPackage, ...}: rec {
  open-fprintd = callPackage ./open-fprintd {};
  fprintd-clients = callPackage ./fprintd-clients {};
  python-validity = callPackage ./python-validity {};
  libfprint-2-tod1-vfs0090-bingch = calib-data-file:
    callPackage ./libfprint-2-tod1-vfs0090-bingch {
      inherit python-validity;
      calib-data = callPackage ./calib-data {inherit calib-data-file;};
    };
}
