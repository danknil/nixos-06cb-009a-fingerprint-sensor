{ inputs, outputs }: rec {
  python-validity = import ./modules/python-validity outputs;
  open-fprintd = import ./modules/open-fprintd outputs;
  default = _: {
    imports = [
      (python-validity outputs)
      (open-fprintd outputs)
    ];
  };
}
