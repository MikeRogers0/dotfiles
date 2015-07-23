export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

alias fr="foreman run"
alias hr="heroku run"
alias bx='bundle exec'
alias s='spring'
alias cdd="cd ../ && cd -"
alias tails="tail -f log/development.log"

alias clear_all_logs="find ~/workspace -iname '*.log' -exec dd if=/dev/null of={} \;"
alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_update_sub_folders='for REPO in `ls`; do (cd "$REPO"; git pull); done;'


alias tails='tail -f log/development.log'
alias oinkers='oink --threshold=1 log/oink.log'
