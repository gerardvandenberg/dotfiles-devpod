{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "base";
      paths = [
        neovim
        go
        nodejs_22
        fd
        ripgrep
        lazygit
        kubectl
        k9s
        fluxcd
        tektoncd-cli
        kubernetes-helm
        miniconda3
      ];
    };
  };
}
