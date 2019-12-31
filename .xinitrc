# Keyboard
# Reset all options
# Toggle layouts using Super+Space
# Remap CapsLock to Escape
# Enable special typographic symbols
# Type level-3 symbols using Right Alt
# Type Compose combinations using Menu key
setxkbmap -layout us,ru \
    -option '' \ 
    -option 'grp:win_space_toggle' \
    -option 'caps:escape' \ 
# Breaks win_space_toggle     -option 'misc:typo' \ 
    -option 'lv3:ralt_switch' \
    -option 'compose:menu'

xmodmap -e "clear Lock"
xset r rate 200 40

xmobar ./xmobarrc &
exec xmonad
