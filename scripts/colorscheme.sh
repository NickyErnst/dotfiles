#!/usr/bin/env bash
# colorscheme.sh
#
# Switch colorscheme for Vim/Neovim and Alacritty.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_colorscheme=$1

if [[ "$to_colorscheme" = "list" ]] || [[ "$to_colorscheme" = "" ]]; then
    echo -e "The current colorscheme is '$current_colorscheme', \
and it can be changed to one of the following list:\n"

    for i in ${colorschemes[*]}; do
        [[ "$i" != "$current_colorscheme" ]] && {
            echo "* $i"
            example_colorscheme=$i
        }
    done

    cat <<EOF

For example, change colorscheme to '$example_colorscheme':

$ colorscheme $example_colorscheme
EOF
    exit 0
fi

exist_flag=1
for i in ${colorschemes[*]}; do
    [[ "$i" = "$to_colorscheme" ]] && {
        exist_flag=0
        break
    }
done

[[ "$exist_flag" -eq 1 ]] && {
    echo "no such colorscheme: \"$to_colorscheme\""
    exit 1
}

update_config_for_alacritty

change_colorscheme_for_alacritty_vim "$to_colorscheme"

exit 0
