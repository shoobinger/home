{ pkgs, ... }:

{

  programs.home-manager = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./neovim/init.vim;
    plugins = [ 
      pkgs.vimPlugins.lightline-vim 
      pkgs.vimPlugins.vim-nix
    ];
  };

  programs.zsh = {
    enable = true;
    profileExtra = ''
      source $HOME/.profile
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
    shellAliases = {
      ".." = "cd ..";
      v = "vim";
      hms = "home-manager switch";
    };
    sessionVariables = {
      EDITOR = "nvim";
      DEFAULT_USER = "ivan";
    };
    enableAutosuggestions = true;
  };

  home.file = {
    ".projectile".source = ./.projectilesrc;
  };
  
}
