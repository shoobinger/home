{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./emacs.nix
  ];

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad/xmonad.hs;
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
    ];
  };

  services.taffybar.enable = true;

  programs.git = {
    enable = true;
    userName  = "suive";
    userEmail = "ivan@suive.name";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal = {
          family = "Fira Mono";
          style = "Regular";
        };
        bold = {
          family = "Fira Mono";
          style = "Bold";
        };
        size = 12.0;
      };
      colors = { 
        primary = { 
          background = "0x0A0E14";
          foreground = "0xB3B1AD";
        };

        normal = {
          black = "0x01060E";
          red = "0xEA6C73";
          green = "0x91B362";
          yellow = "0xF9AF4F";
          blue = "0x53BDFA";
          magenta = "0xFAE994";
          cyan = "0x90E1C6";
          white = "0xC7C7C7";
        };

        bright = {
          black = "0x686868";
          red = "0xF07178";
          green = "0xC2D94C";
          yellow = "0xFFB454";
          blue = "0x59C2FF";
          magenta = "0xFFEE99";
          cyan = "0x95E6CB";
          white = "0xFFFFFF";
        };  
      };
    };
  };

  programs.zsh = {
    shellAliases = {
      ns = "sudo nixos-rebuild switch";
    };
  };

  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      vim-vixen
      ublock-origin
      bitwarden
    ];
    profiles = {
      "ivan" = {
        settings = {
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
		      "browser.newtabpage.activity-stream.feeds.snippets" = false;
		      "browser.newtabpage.activity-stream.feeds.topsites" = false;
		      "browser.newtabpage.activity-stream.feeds.highlights" = false;
		      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

          "layers.acceleration.force-enabled" = true;
          "layers.gpu-process.force-enabled" = true;

		      "general.warnOnAboutConfig" = false;
		      "browser.warnOnQuit" = false;
  
		      "extensions.pocket.enabled" = false;

          "app.shield.optoutstudies.enabled" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.server" = "";
		 
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;

          "services.sync.engine.passwords" = false;
          "signon.rememberSignons" = false;
          "signon.autofillForms" = false;

          "dom.webnotifications.enabled" = false;
          "dom.webnotifications.serviceworker.enabled" = false;
          "dom.push.enabled" = false;
          "dom.pushconnection.enabled" = false;
        };
      };
    };
  };

  programs.mpv.enable = true;

  home.file = {
    ".xinitrc".source = ./.xinitrc;
    ".xmobarrc".source = ./xmonad/xmobarrc;
  };
}
