{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "rancher-workflow";
      paths = [
        # Basic development tools
        zsh-completions
        neovim
        go
        nodejs_20
        fzf
        ripgrep

        # Kubernetes tools
        kubectl
        kubectx
        k9s
        helm

        # Other tools
        lazygit
        vault
      ];
    };
  };
}
