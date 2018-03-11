import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- startup = do
--   spawn "stalonetray -t --geometry 1x1-0 --grow-gravity SE --icon-gravity SE"

main = xmonad $ def {
    terminal = "termite",
    -- startupHook = startup,
    modMask = mod4Mask,
--    manageHook = manageHook def <+> (className =? "stalonetray" --> doIgnore),
    layoutHook = smartBorders $ layoutHook def
  } `additionalKeys` [ 
    ((mod4Mask, xK_p), spawn "dmenu_run -fn hack-14")
  ]
