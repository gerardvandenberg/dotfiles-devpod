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
        # Use pre-built vault instead of building from source
        (pkgs.vault.override { 
          usePrebuiltBinaries = true;
        })
      ];
    };
  };
}
