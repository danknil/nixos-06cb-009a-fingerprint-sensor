{callPackage, ...}: rec {
  open-fprintd = callPackage ./open-fprintd {};
  fprintd-clients = callPackage ./fprintd-clients {};
  python-validity = callPackage ./python-validity {};
}
