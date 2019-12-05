import XMonad
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP, removeKeysP)
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Actions.Navigation2D
import XMonad.Actions.GroupNavigation

main = do
  xmproc <- spawnPipe "xmobar ~/.xmobarrc"
  xmonad 
    $ navigation2DP def ("k", "h", "j", "l")
                        [("M-",   windowGo  )
                        ,("M-S-", windowSwap)]
                        False
    $ desktopConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
    , logHook = historyHook
    , terminal  = "alacritty"
    , modMask   = mod4Mask
    , normalBorderColor  = "#000000"
    , focusedBorderColor = "#8ac6f2"
    } `additionalKeysP`
    [ ("M-<Tab>", nextMatch History (return True))
    , ("M-y", spawn "firefox")
    , ("M-<Return>", spawn "alacritty")
    , ("M-S-q", spawn "systemctl suspend")
    , ("M-d", spawn "dmenu_run -fn 'Fira Sans'")
    , ("M-q", kill)
    , ("M-<XF86AudioRaiseVolume>", spawn "amixer -c 0 -q set Master 2dB+ unmute")
    , ("M-<XF86AudioLowerVolume>", spawn "amixer -c 0 -q set Master 2dB- unmute")
    , ("M-<XF86AudioMute>", spawn "amixer -c 0 -q set Master toggle")
    ] `removeKeysP`
    [ "M-<Space>"]
