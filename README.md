# Mike Rogers - Dotfiles

My main setup, mostly copied from https://github.com/phil/dotfiles https://github.com/mijndert/dotfiles and https://github.com/DanHarper/dotfiles .

## How to setup

Copy parts of files as required, here is a quick few notes though:

### Vim

I usually use [MacVim](https://macvim-dev.github.io/macvim/) for writing & coding. To install plugins I used [vim-plug](https://github.com/junegunn/vim-plug).

![VIM Theme Preview](https://raw.githubusercontent.com/MikeRogers0/dotfiles/master/media/vim.png)

### Apps

https://beardedspice.github.io/ - Stops iTunes opening when I press play/pause.

http://magnet.crowdcafe.com/ - Allows for moving windows around the screen with key commands.

https://imageoptim.com/mac - Compress images easily.

https://github.com/jamsinclair/ballast - Fix that annoying Bluetooth bug which makes audio play drift to one ear.

### Homebrew packages

I don't like install to much stuff, but here are the main packages I installed

    cmake
    heroku
    heroku-node
    imagemagick
    neovim
    node
    openssl
    postgresql
    puma-dev
    rbenv
    redis
    ruby-build
    the_silver_searcher
    yarn
    ffmpeg
    vim --with-lua --with-override-system-vi

### MacOS tweaks

I try to leave MacOS as default as possible, but here are some terminal commands I run to make things a bit snappier & suitable for dev.

    # Do not keep wifi connected while powered off
    sudo pmset -b tcpkeepalive 0
    
    # Do not keep power to the RAM while sleeping
    sudo pmset -a hibernatemode 25

    # Speed up window tranisations
    defaults write NSGlobalDomain NSWindowResizeTime 0.01;

    # Speed up mission control transition (F3)
    defaults write com.apple.dock expose-animation-duration -float 0.1; 

    # Speed up Launchpad (F4)
    defaults write com.apple.dock springboard-show-duration -float 0.1;
    defaults write com.apple.dock springboard-hide-duration -float 0.1;

    # Show hidden files in finder
    defaults write com.apple.finder AppleShowAllFiles YES;

    # Restart dock so effects can kick in.
    killall Dock;
