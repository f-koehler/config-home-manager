{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "fkoehler";
  home.homeDirectory = "/home/fkoehler";
  xdg.stateHome = "/home/fkoehler/.local/statstate";

  home.packages = with pkgs; [
    nixpkgs-fmt
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    alacritty = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
    exa = {
      enable = true;
      enableAliases = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      userName = "Fabian Köhler";
      userEmail = "fabian.koehler@protonmail.ch";
      signing = {
        key = "C5DC80511469AD81C84E3564D55A35AFB2900A11";
        signByDefault = true;
      };
    };
    gpg = {
      enable = true;
    };
    htop = {
      enable = true;
    };
    neovim = {
      enable = true;
      extraConfig = ''
              set nocompatible
        set number
        set ruler
        set autoindent
        syntax on
        set incsearch
        set hlsearch
      '';
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter
      ];
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        resurrect
        continuum
      ];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      history = {
        ignoreDups = true;
        ignorePatterns = [
          "rm *"
          "pkill *"
        ];
        ignoreSpace = true;
        save = 100000;
        share = true;
        size = 100000;
      };
      initExtra = "
        bindkey \"^[[H\"    beginning-of-line
        bindkey \"^[[1~\"   beginning-of-line
        bindkey \"^[OH\"    beginning-of-line
        bindkey \"^[[F\"    end-of-line
        bindkey \"^[[4~\"   end-of-line
        bindkey \"^[OF\"    end-of-line
        bindkey \"^[[3~\"   delete-char
        bindkey \"^[[1;5D\" backward-word
        bindkey \"^[[1;3D\" backward-word
        bindkey \"^[^[[D\"  backward-word
        bindkey \"^[[1;5C\" forward-word
        bindkey \"^[[1;3C\" forward-word
        bindkey \"^[^[[C\"  forward-word

        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup=\"$('$HOME/.local/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)\"
        if [ $? -eq 0 ]; then
            eval \"$__conda_setup\"
        else
            if [ -f \"$HOME/.local/opt/anaconda3/etc/profile.d/conda.sh\" ]; then
                . \"$HOME/.local/opt/anaconda3/etc/profile.d/conda.sh\"
            else
                export PATH=\"$HOME/.local/opt/anaconda3/bin:$PATH\"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
        export PATH=\"\${HOME}/.local/bin:\${PATH}\"

        export PATH=\"/opt/homebrew/bin/:\${PATH}\"
        ";
    };
  };
}
