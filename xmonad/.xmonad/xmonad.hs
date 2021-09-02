import XMonad
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig (additionalKeys)
import qualified Data.Map as M

myKeys = [ ((mod4Mask, xK_p), spawn "rofi -show combi")
         , ((mod4Mask, xK_s), spawn "flameshot gui")
         , ((0, xF86XK_AudioRaiseVolume), spawn "volumeControl.sh up")
         , ((0, xF86XK_AudioLowerVolume), spawn "volumeControl.sh down")
         , ((0, xF86XK_MonBrightnessUp), spawn "brightnessControl.sh up")
         , ((0, xF86XK_MonBrightnessDown), spawn "brightnessControl.sh down")
	 ]


main = do
    h <- spawnPipe "xmobar"
    xmonad $ docks $ ewmh def { 
	      terminal        = "kitty"
	    , modMask         = mod4Mask
		  , logHook         = dynamicLogWithPP xmobarPP {ppOutput = hPutStrLn h}
		  , handleEventHook = handleEventHook def <+> fullscreenEventHook
	    , layoutHook      = smartBorders $ avoidStruts $ layoutHook def
		} `additionalKeys` myKeys

