feh --bg-scale ~/dotfiles/arch_linux_flat_wallpaper.jpg

setxkbmap -layout 'us,ru' -variant ',' -option 'grp:alt_shift_toggle'

xmodmap -e 'clear Lock'
xmodmap -e 'clear Control'
xmodmap -e 'clear Mod4'

xmodmap -e 'keycode 37 = Control_R'
xmodmap -e 'keycode 66 = Control_L'

xmodmap -e 'add Mod4 = Control_R'
xmodmap -e 'add Control = Control_L'

skype &

exec xmonad
