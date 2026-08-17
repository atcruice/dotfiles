{ config, pkgs, lib, ... }:

let
  bashSensible = builtins.fetchGit {
    ref = "refs/tags/v0.2.3";
    url = "https://github.com/mrzool/bash-sensible";
  };

  githubGitignore = builtins.fetchGit {
    ref = "main";
    rev = "e5323759e387ba347a9d50f8b0ddd16502eb71d4"; # 2022-05-11
    url = "https://github.com/github/gitignore";
  };

  vim-argonaut = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-argonaut";
    version = "25.3.30.0";
    src = pkgs.fetchgit {
      hash = "sha256-ucEiA7+jWTRYZD3W5N8EkH7QQwB0cK/1nHeR1AeE5FY=";
      rev = "refs/tags/25.3.30.0";
      url = "https://git.sr.ht/~foosoft/argonaut.nvim";
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
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vim-liquid"
    "vim-polyglot"
  ];

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
  home.stateVersion = "26.05";

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
    ipcalc
    ncdu_1
    niv
    nmap
    overmind
    pgformatter
    ripgrep
    rmlint
    ruby_3_3
    shellcheck
    universal-ctags
    unixtools.watch
    vim-vint
    witr
    yamllint
    yt-dlp
  ];

  home.activation = pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    impureAction = config.lib.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD mkdir -p $VERBOSE_ARG $HOME/.1password
      $DRY_RUN_CMD ln -fs $VERBOSE_ARG $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock $HOME/.1password/agent.sock
    '';
  };
  home.enableNixpkgsReleaseCheck = true;
  home.file = {
    ".config/tmux/tmux.conf".source = ./config/tmux.conf;
    ".config/yamllint/config".source = ./config/yamllint.yml;
    ".gemrc".source = ./config/gemrc;
    ".ignore".source = ./config/ignore;
    ".inputrc".source = ./config/inputrc;
    ".pg_format".source = ./config/pg_format;
    ".psqlrc".source = ./config/psqlrc;
  };
  home.sessionVariables = {
    CLICOLOR = "1";
    DIRENV_WARN_TIMEOUT = "0";
    DISABLE_SPRING = "true";
    GPG_TTY = "$(tty)";
    LESS = "--ignore-case --squeeze-blank-lines --RAW-CONTROL-CHARS --quit-if-one-screen";
    PAGER = "less";
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };

  nixpkgs.config = {
    vim = {
      darwin = pkgs.stdenv.hostPlatform.isDarwin;
      gui = "no";
      perl = true;
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      ${builtins.readFile (bashSensible + "/sensible.bash")}
      ${builtins.readFile ./programs/bash/sensible_overrides.sh}
      ${builtins.readFile ./programs/bash/functions.sh}
      ${builtins.readFile ./programs/bash/prompt.sh}
      stty sane
      stty -ixon iutf8
      . "$HOME/.nix-profile/share/bash-completion/bash_completion"
      . "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash"
    '';
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.fzf = {
    defaultCommand = "rg --files --hidden --vimgrep";
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      alias = {
        ap = "add --patch";
        cm = "checkout main";
        fixup = "!f() { git commit --fixup=$1; }; f";
        l = "log --oneline --decorate --graph";
        pp = "pull --prune";
        s = "status";
        unwip = "!f() { [[ $(git log -1 --pretty=%s) == 'WIP' ]] && git reset HEAD^; }; f";
        wip = "!git add --all; git commit -m \"WIP\"";
      };
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
      user = {
        email = "alex.cruice@gmail.com";
        name = "Alex Cruice";
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
      format = "openpgp";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExM5Y1k1gThK+y7vmBq3hRAL+iIl3fD55LlXawVwsmS";
      signByDefault = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        HashKnownHosts = "no";
        IdentityAgent = "~/.1password/agent.sock";
        IgnoreUnknown = "UseKeychain";
        UseKeychain = "yes";
      };
    };
  };

  programs.neovim = {
    coc = {
      enable = true;
      pluginConfig = builtins.readFile ./programs/vim/plugins/coc.vim;
    };
    defaultEditor = true;
    enable = true;
    extraConfig = ''
      scriptencoding utf-8
      ${builtins.readFile ./programs/vim/settings.vim}
      ${builtins.readFile ./programs/vim/mappings.vim}
    '';
    plugins = [
      {
        config = builtins.readFile ./programs/vim/plugins/ale.vim;
        plugin = pkgs.vimPlugins.ale;
        type = "viml";
      }
      {
        config = builtins.readFile ./programs/vim/plugins/fzf-vim.vim;
        plugin = pkgs.vimPlugins.fzf-vim;
        type = "viml";
      }
      {plugin = pkgs.vimPlugins.jellybeans-vim;}
      {
        config = builtins.readFile ./programs/vim/plugins/lightline-vim.vim;
        plugin = pkgs.vimPlugins.lightline-vim;
        type = "viml";
      }
      {plugin = pkgs.vimPlugins.splitjoin-vim;}
      {plugin = pkgs.vimPlugins.tcomment_vim;}
      {
        config = builtins.readFile ./programs/vim/plugins/vim-argonaut.lua;
        plugin = vim-argonaut;
        type = "lua";
      }
      {plugin = pkgs.vimPlugins.vim-eunuch;}
      {plugin = pkgs.vimPlugins.vim-fugitive;}
      {plugin = pkgs.vimPlugins.vim-gitgutter;}
      {plugin = pkgs.vimPlugins.vim-gutentags;}
      {plugin = pkgs.vimPlugins.vim-liquid;}
      {
        config = builtins.readFile ./programs/vim/plugins/vim-move.vim;
        plugin = pkgs.vimPlugins.vim-move;
        type = "viml";
      }
      {plugin = pkgs.vimPlugins.vim-polyglot;}
      {plugin = pkgs.vimPlugins.vim-rails;}
      {plugin = pkgs.vimPlugins.vim-sensible;}
      {plugin = pkgs.vimPlugins.vim-surround;}
      {
        config = builtins.readFile ./programs/vim/plugins/vim-test.vim;
        plugin = pkgs.vimPlugins.vim-test;
        type = "viml";
      }
      {
        config = builtins.readFile ./programs/vim/plugins/vim-textobj-indent.vim;
        plugin = vim-textobj-indent;
        type = "viml";
      }
      {plugin = pkgs.vimPlugins.vim-textobj-user;}
      {plugin = pkgs.vimPlugins.vim-unimpaired;}
      {plugin = vim-yaml-helper;}
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;
  };
}
