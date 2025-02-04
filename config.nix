{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "rancher-workflow";
      paths = [
        # Basic development tools
        zsh-completions
        neovim
        fzf
        ripgrep
        direnv
        tmux
        ping
        nslookup
        dig
        nc
        # Kubernetes tools
        kubectl
        kubectx
        k9s
        kubernetes-helm
        # Other tools
        lazygit
        gost
        rke
      ];
    };
  };
}
