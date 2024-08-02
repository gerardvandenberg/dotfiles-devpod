{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "base";
      paths = [
        neovim
        fzf
        go
        nodejs_22
        fd
        ripgrep
        lazygit
        kubectl
        kubectx
        k9s
        fluxcd
        tektoncd-cli
        kubernetes-helm
        # python311Packages.conda
      ];
    };
  };
}
