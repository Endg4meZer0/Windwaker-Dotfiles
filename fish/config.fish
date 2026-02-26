if status is-interactive
	clear
	chafa --size=25 $HOME/Pictures/memes/fish-on-floor-1585745742.gif
	rust-motd
    # Commands to run in interactive sessions can go here
end

set --universal pure_color_success brgreen
set --universal pure_show_system_time true
set --universal pure_color_system_time pure_color_mute

# Created by `pipx` on 2024-10-31 02:40:39
set PATH $PATH /home/endg4me/.local/bin

fish_add_path /home/endg4me/.spicetify

# pnpm
set -gx PNPM_HOME "/home/endg4me/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
