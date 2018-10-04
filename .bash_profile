export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

if [ -f ~/dotfiles/.terminal-styling.bash ]; then
  . ~/dotfiles/.terminal-styling.bash
fi

alias hr="heroku run"
alias bx='bundle exec'
alias cdd="cd ../ && cd -"

alias clear_all_logs="find ~/ -iname '*.log' -exec dd if=/dev/null of={} \;"
alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_remove_all_branches_but_master='git branch | grep -v "master" | xargs git branch -D'
alias git_update_sub_folders='for REPO in `ls`; do (cd "$REPO"; git pull); done;'
alias git_add_to_last_commit='git commit --amend -C HEAD --no-verify'

alias tails='tail -f log/development.log'
alias oinkers='oink --threshold=1 log/oink.log'
alias unpickle_db='bx rake db:drop && bx rake db:create && bx rake db:migrate && bx rake db:test:load && bx rake db:reset'
alias puma_logs='tail -f ~/Library/Logs/puma-dev.log'

# reimport_db project_development file.sql
reimport_db() {
  pg_restore --verbose --clean --no-acl --no-owner -j 2 -h localhost -d "$1" "$2"
}

# Convert .mov files made by quicktime to smaller .mp4s.
# mov_to_mp4 video.mov
mov_to_mp4() {
  ffmpeg -i "$1" -vcodec h264 -acodec mp3 "$1".mp4
}

# Convert .mov files made by quicktime to bigish .gif
# mov_to_gif video.mov
mov_to_gif() {
  ffmpeg -i "$1" -pix_fmt rgb24 "$1".gif
}
