# Mike Rogers - Dotfiles

My main setup, mostly copied from [phil](https://github.com/phil/dotfiles), [mijndert](https://github.com/mijndert/dotfiles) and [DanHarper](https://github.com/DanHarper/dotfiles).

In 2020 I aimed to install as few "things" as possible on a new machine & keep everything as default as possible. 

## How to setup

Copy parts of files as required. I did setup `./install.sh`, though I'm not sure if that'll work every time.

### Vim

I usually use [MacVim](https://macvim-dev.github.io/macvim/) for writing & coding. To install plugins I used [vim-plug](https://github.com/junegunn/vim-plug).

![VIM Theme Preview](https://raw.githubusercontent.com/MikeRogers0/dotfiles/master/media/vim.png)

### Terminal

I use zsh as my default terminal with https://ohmyz.sh/ installed running the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

### Apps

http://magnet.crowdcafe.com/ - Allows for moving windows around the screen with key commands.

https://beardedspice.github.io/ - Stops iTunes opening when I press play/pause.

https://imageoptim.com/mac - Compress images easily.

https://www.tunabellysoftware.com/balance_lock/ - Fix that annoying Bluetooth bug which makes audio play drift to one ear.

https://www.docker.com/products/docker-desktop - Docker

### Brew

Everything I've normally got installed is in the `Brewfile`, run `brew bundle` to install. To create a new dump run `brew bundle dump --force --describe`
