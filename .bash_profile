export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

alias fr="foreman run"
alias hr="heroku run"
alias bx='bundle exec'
alias s='spring'
alias cdd="cd ../ && cd -"

alias clear_all_logs="find ~/workspace -iname '*.log' -exec dd if=/dev/null of={} \;"
alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
