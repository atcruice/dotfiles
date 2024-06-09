{ config, pkgs, ... }:

let
  bashSensible = builtins.fetchGit {
    ref = "refs/tags/v0.2.3";
    url = "https://github.com/mrzool/bash-sensible";
  };

  concatDir = dirname: pkgs.lib.pipe dirname [
    builtins.readDir
    (pkgs.lib.filterAttrs (_: v: v == "regular"))
    (pkgs.lib.mapAttrsToList (k: _: k))
    (pkgs.lib.concatMapStrings (basename: builtins.readFile (dirname + "/${basename}")))
  ];

  githubGitignore = builtins.fetchGit {
    ref = "main";
    rev = "e5323759e387ba347a9d50f8b0ddd16502eb71d4"; # 2022-05-11
    url = "https://github.com/github/gitignore";
  };

  tabnine-YouCompleteMe = pkgs.vimUtils.buildVimPlugin {
    pname = "tabnine-YouCompleteMe";
    version = "2022-09-28";
    src = pkgs.fetchFromGitHub {
      fetchSubmodules = true;
      owner = "tabnine";
      repo = "YouCompleteMe";
      rev = "cf2bb6e27e941a6232aa412f9ff2e83f023dce4e";
      sha256 = "7JOyUInPGriwLMARZ51qcec69CsBQTJo+RDfc139ILs=";
    };
    buildInputs = [
      pkgs.cacert
      pkgs.cmake
      pkgs.git
      pkgs.python3Full
    ];
    postInstall = ''
      $out/install.py
      PYTHONPATH=$out python3 -c 'import sys; sys.path.remove(""); from third_party.ycmd.third_party.tabnine import Tabnine; Tabnine()'
    '';
  };

  vim-argwrap = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-argwrap";
    version = "2022-07-15";
    src = pkgs.fetchFromGitHub {
      owner = "FooSoft";
      repo = "vim-argwrap";
      rev = "feaba6b8b6ca099d267c81ee2c4ba43ce6de8499";
      sha256 = "xC2LNKIvFTeSYZspigPH7PTdpVWpR7n+xa8IHK7MYdE=";
    };
  };

  vim-textobj-indent = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-textobj-indent";
    version = "0.0.6";
    src = pkgs.fetchFromGitHub {
      owner = "kana";
      repo = "vim-textobj-indent";
      rev = "0.0.6";
      sha256 = "oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
    };
  };

  vim-yaml-helper = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-yaml-helper";
    version = "2016-05-27";
    src = pkgs.fetchFromGitHub {
      owner = "henrik";
      repo = "vim-yaml-helper";
      rev = "4090c9f1bfee054283d1fe26bf9e9b1781ff1465";
      sha256 = "P0ndY0rvpfERtldY5gkj80wWpEtYJsSftJtJIKJF1M0=";
    };
  };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  home.sessionPath = [
    "$HOME/bin"
  ];

  home.packages = with pkgs; [
    bash-completion
    bashInteractive
    colima
    delta
    docker
    exercism
    ncdu
    niv
    nmap
    overmind
    python310Packages.grip
    ripgrep
    ruby
    shellcheck
    siege
    universal-ctags
    unixtools.watch
    vim-vint
    yamllint
    yt-dlp
  ];

  home.activation = pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
    impureAction = config.lib.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD mkdir -p $VERBOSE_ARG $HOME/.1password
      $DRY_RUN_CMD ln -fs $VERBOSE_ARG $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock $HOME/.1password/agent.sock
    '';
  };
  home.enableNixpkgsReleaseCheck = true;
  home.file = {
    ".config/nix/nix.conf".source = ~/.dotfiles/config/nix.conf;
    ".config/tmux/tmux.conf".source = ~/.dotfiles/config/tmux.conf;
    ".config/yamllint/config".source = ~/.dotfiles/config/yamllint.yml;
    ".gemrc".source = ~/.dotfiles/config/gemrc;
    ".ignore".source = ~/.dotfiles/config/ignore;
    ".inputrc".source = ~/.dotfiles/config/inputrc;
    ".psqlrc".source = ~/.dotfiles/config/psqlrc;
  };
  home.sessionVariables = {
    CLICOLOR = "1";
    DISABLE_SPRING = "true";
    EDITOR = "vim";
    GPG_TTY = "$(tty)";
    LESS = "--ignore-case --squeeze-blank-lines --LONG-PROMPT --RAW-CONTROL-CHARS";
    PAGER = "less";
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };

  nixpkgs.config = {
    vim = {
      darwin = pkgs.stdenv.isDarwin;
      gui = "no";
      perl = true;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      ${builtins.readFile (bashSensible + "/sensible.bash")}
      ${builtins.readFile ~/.dotfiles/programs/bash/sensible_overrides.sh}
      ${builtins.readFile ~/.dotfiles/programs/bash/functions.sh}
      ${builtins.readFile ~/.dotfiles/programs/bash/prompt.sh}
      stty sane
      stty -ixon iutf8
      . "$HOME/.nix-profile/share/bash-completion/bash_completion"
      . "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash"
    '';
  };

  programs.fzf = {
    defaultCommand = "rg --files --hidden --vimgrep";
    enable = true;
  };

  programs.git = {
    enable = true;
    aliases = {
      ap = "add --patch";
      cm = "checkout main";
      fixup = "!f() { git commit --fixup=$1; }; f";
      l = "log --oneline --decorate --graph";
      pp = "pull --prune";
      s = "status";
      unwip = "!f() { [[ $(git log -1 --pretty=%s) == 'WIP' ]] && git reset HEAD^; }; f";
      wip = "!git add --all; git commit -m \"WIP\"";
    };
    delta = {
      enable = true;
    };
    extraConfig = {
      branch = {
        autoSetupRebase = "always";
      };
      color = {
        ui = "auto";
      };
      diff = {
        compactionHeuristic = true;
      };
      gpg = {
        format = "ssh";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictstyle = "diff3";
        log = true;
      };
      mergetool = {
        prompt = false;
      };
      push = {
        autoSetupRemote = true;
      };
      rebase = {
        autosquash = true;
        autostash = true;
      };
      rerere = {
        enabled = 1;
      };
      status = {
        showUntrackedFiles = "all";
      };
      tag = {
        sort = "version:refname";
      };
    };
    ignores = pkgs.lib.strings.splitString "\n" ''
      ${builtins.readFile (githubGitignore + "/Global/Archives.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/Backup.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/Dropbox.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/GPG.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/Tags.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/Vim.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/Xcode.gitignore")}
      ${builtins.readFile (githubGitignore + "/Global/macOS.gitignore")}
      ${builtins.readFile (githubGitignore + "/Node.gitignore")}
      ${builtins.readFile (githubGitignore + "/Rails.gitignore")}
      ${builtins.readFile (githubGitignore + "/Ruby.gitignore")}
      ${builtins.readFile (githubGitignore + "/community/Exercism.gitignore")}
      ${builtins.readFile (githubGitignore + "/community/OpenSSL.gitignore")}
      *.ctags
      .direnv
      tags.*
    '';
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExM5Y1k1gThK+y7vmBq3hRAL+iIl3fD55LlXawVwsmS";
      signByDefault = true;
    };
    userEmail = "alex.cruice@gmail.com";
    userName = "Alex Cruice";
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentityAgent ~/.1password/agent.sock
      IgnoreUnknown UseKeychain
      UseKeychain yes
    '';
    hashKnownHosts = false;
  };

  programs.vim = {
    enable = true;
    extraConfig = ''
      scriptencoding utf-8
      ${concatDir ~/.dotfiles/programs/vim/plugins}
      ${builtins.readFile ~/.dotfiles/programs/vim/settings.vim}
      ${builtins.readFile ~/.dotfiles/programs/vim/mappings.vim}
    '';
    plugins = with pkgs.vimPlugins; [
      ale
      emmet-vim
      fzf-vim
      jellybeans-vim
      lightline-vim
      splitjoin-vim
      tabnine-YouCompleteMe
      tcomment_vim
      vim-argwrap
      vim-eunuch
      vim-fugitive
      vim-gitgutter
      vim-gutentags
      vim-liquid
      vim-move
      vim-polyglot
      vim-rails
      vim-sensible
      vim-surround
      vim-test
      vim-textobj-indent
      vim-textobj-user
      vim-unimpaired
      vim-yaml-helper
    ];
    settings = {
      background = "dark";
      # backupdir = [];
      copyindent = false;
      # directory = [];
      expandtab = true;
      hidden = true;
      history = 1000;
      ignorecase = true;
      modeline = true;
      mouse = "a";
      mousefocus = false;
      mousehide = true;
      mousemodel = "extend";
      number = true;
      relativenumber = false;
      shiftwidth = 0;
      smartcase = true;
      tabstop = 2;
      # undodir = [];
      undofile = false;
    };
  };
}
