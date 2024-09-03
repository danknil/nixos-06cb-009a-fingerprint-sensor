{
  outputs,
  pkgs,
}: {
  libfprint-2-tod1-vfs0090-bingch = calib-data-file:
    pkgs.callPackage ./pkgs/libfprint-2-tod1-vfs0090-bingch {
      inherit (outputs.packages.x86_64-linux) python-validity;
      calib-data = pkgs.callPackage ./pkgs/calib-data {inherit calib-data-file;};
    };
}
