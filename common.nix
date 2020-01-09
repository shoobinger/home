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
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      ls = "ls -hla --color=auto";
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

  home.file.".projectile".source = ./.projectile;
}
