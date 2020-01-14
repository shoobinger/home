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
    initExtra = builtins.readFile ./.zshrc;
    shellAliases = {
      ".." = "cd ..";
      v = "vim";
      hms = "home-manager switch";
    };
    sessionVariables = {
      EDITOR = "nvim";
      DEFAULT_USER = "ivan";
      ZSH_AUTOSUGGEST_USE_ASYNC="true";
      ZSH_AUTOSUGGEST_MANUAL_REBIND="true";
      PROMPT="|%F{153}%n@%m%f|%F{174}%1~%f> ";
    };
    enableAutosuggestions = true;
  };

  home.file = {
    ".projectile".source = ./.projectilesrc;
  };
  
}
