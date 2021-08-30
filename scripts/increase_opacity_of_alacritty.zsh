#!/usr/bin/env zsh
# increase_opacity_of_alacritty.zsh
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.zsh

to_opacity=0$(echo "scale=2;$current_opacity+$opacity_step" | bc)

[[ $to_opacity -gt 1 ]] && exit 0

[[ $to_opacity = 01.00 ]] && to_opacity=1

to_opacity=$(trim_opacity_suffix $to_opacity)

update_config_for_alacritty

change_opacity_for_alacritty "$to_opacity"

exit 0
