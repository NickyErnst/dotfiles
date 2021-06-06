# Windvalley's dotfiles 🍀

This is my personal development environment focusing on
Go, Python, OpenResty/Lua, Bash and JavaScript programming.

## 💝 Powers

- [Vim](https://github.com/vim/vim) or [Neovim](https://github.com/neovim/neovim)
- [Tmux](https://github.com/tmux/tmux)
- [Zsh](https://ohmyz.sh/)
- [Ranger](https://github.com/ranger/ranger)
- [Alacritty](https://github.com/alacritty/alacritty)

## 📀 Installation

Requirements:

- [vim 8.2+](https://github.com/vim/vim) or
  [Neovim 0.4.0+](https://github.com/neovim/neovim)
- [tmux 3.0+](https://github.com/tmux/tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [alacritty](https://github.com/alacritty/alacritty)
- [ranger](https://github.com/ranger/ranger)

To install, run the following from your terminal:
(please backup your existing dotfiles first)

```bash
git clone https://github.com/windvalley/dotfiles.git ~/.dotfiles

# vim
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

# nvim
mkdir -p ~/.config/nvim && ln -sf ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# zsh
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# ranger
ln -sf ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

# alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp ~/.dotfiles/alacritty/alacritty_private.yml ~/.alacritty_private.yml
```

💡 You can go to the beginning of each dotfile to view the detailed installation steps.

To update:

```bash
cd ~/.dotfiles
git pull
```

## 📜 Tips

**Change colorscheme of Vim/Neovim and Alacritty:**

```text
theme

Current theme is 'dracula', you can change to follows:

* molokai
* rigel
* jellybeans
* base16-default-dark
* nord
* gruvbox
* solarized
* one
* iceberg

For example, change theme to 'iceberg':

$ theme iceberg
```

**Change font size of Alacritty:**

```text
font

Current font size is '12.0', you can change by:

$ font number

* number should between 1.0 and  200.0
```

**Change opacity of Alacritty:**

```text
opacity

Current opacity is '0.9', you can change by:

$ opacity number

* number should between 0.0 and 1.0
```

**Toggle Vim/Neovim transparent background color:**

```text
vim-bgtransparent

Vim background transparent was enabled, to disable:

$ vim-bgtransparent 0
```

💡 Almost every dotfile has usage tips at the end of it for reference.

## 🔮 Show

![show](images/show.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
