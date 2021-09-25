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

xmobarEscape = concatMap doubleLts
  where doubleLts '<' = "<<"
        doubleLts x   = [x]

myWorkspaces = clickable . (map xmobarEscape) $ ["1:\xf120","2:\xf269","3:\xf121", "4:\xe217","5:\xe28b","6:\xf04b","7","8","9"]
  where                                                                       
         clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                            (i,ws) <- zip [1..9] l,
                            let n = i ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks $ ewmh def { 
	      terminal        = "kitty"
	    , modMask         = mod4Mask
            , workspaces      = myWorkspaces
            , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc }
            , handleEventHook = handleEventHook def <+> fullscreenEventHook
            , layoutHook      = smartBorders $ avoidStruts $ layoutHook def
              } `additionalKeys` myKeys

