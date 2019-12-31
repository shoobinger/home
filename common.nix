{ pkgs, ... }:

{
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
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      ls = "ls -hNla --color=auto";
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

  programs.ssh = {
    enable = true;
    serverAliveInterval = 60;
  };

}
