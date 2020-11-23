#!/bin/bash

echo "Installing Brew bits"

brew bundle

echo ""
echo "Maybe install asdf here?"

# asdf plugin add crystal
# asdf plugin add elixir
# asdf plugin add erlang
# asdf plugin add nodejs
# asdf plugin add python
# asdf plugin add ruby
# asdf plugin add yarn

# asdf install

echo ""

echo ""
echo "Linking Files"

for dotfile in .*; do
  test -f || continue
  if [ -f "$dotfile" ]; then
    echo "Linking: $dotfile"
    rm ~/$dotfile
    ln -s $PWD/$dotfile ~/$dotfile
  fi
done

echo ""
echo "Install oh.my.zsh"

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo ""
echo "Adding plug.vim"

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo ""
echo "Installing Vim plugins"

# vim +PlugInstall +qall >/dev/null 2>&1

echo ""
echo "Install Ruby Gems"

gem install rubocop
gem install rubocop-rspec
gem install rubocop-rails
gem install rubocop-performance

npm install -g prettier
