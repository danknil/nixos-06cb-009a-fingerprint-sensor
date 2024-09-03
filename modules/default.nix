{ inputs, outputs }: rec {
  python-validity = import ./python-validity outputs;
  open-fprintd = import ./open-fprintd outputs;
  default = _: {
    imports = [
      (python-validity outputs)
      (open-fprintd outputs)
    ];
  };
}
