{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      allowUnfree = true;
      name = "rancher-workflow";
      paths = [
        zsh-completions
        neovim
        go
        nodejs_22
        pure-prompt
        fd
        ripgrep
        fzf
        helm
        lazygit
        kubectl
        kubectx
        k9s
        velero
        pluto
        vault
        argo
        rancher
      ];
    };
  };
}
