{
  pkgs ? import <nixpkgs> { },

  crossPkgs ? import <nixpkgs> {
    crossSystem = {
      system = "riscv64-none-elf";
    };
  },
}:
crossPkgs.mkShell {
  nativeBuildInputs = [
    # Using crossPkgs.mkShell provides a fully qualified set of build tools,
    # but we also need native gcc for mkfs
    pkgs.gcc

    pkgs.qemu
    pkgs.bc
  ];

  env.TOOLPREFIX = "riscv64-unknown-none-elf-";
}
