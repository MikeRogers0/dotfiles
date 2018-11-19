# OpenSSL fix for MacOS
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Users/Mike/.rbenv/shims:/usr/local/opt/openssl/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Mike/.vimpkg/bin"

# Rbenv for Ruby
eval "$(rbenv init -)"

# Import the libraries I use
if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

if [ -f ~/dotfiles/.dockerfunc ]; then
  . ~/dotfiles/.dockerfunc
fi

if [ -f ~/dotfiles/.terminal-styling.bash ]; then
  . ~/dotfiles/.terminal-styling.bash
fi

# Alias commands

alias bx='bundle exec'
alias cdd="cd ../ && cd -"
alias clear_all_logs="find ~/ -iname '*.log' -exec dd if=/dev/null of={} \;"

alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_remove_all_branches_but_master='git branch | grep -v "master" | xargs git branch -D'
alias git_update_sub_folders='for REPO in `ls`; do (cd "$REPO"; git pull); done;'
alias git_add_to_last_commit='git commit --amend -C HEAD --no-verify'

alias tails='tail -f log/development.log'
alias puma_logs='tail -f ~/Library/Logs/puma-dev.log'

# reimport_db project_development file.sql
reimport_db() {
  pg_restore --verbose --clean --no-acl --no-owner -j 2 -h localhost -d "$1" "$2"
}

# Convert .mov files made by quicktime to smaller .mp4s.
# mov_to_mp4 video.mov
# It also tries to optimise for the OSX mic and for voice.
mov_to_mp4() {
  ffmpeg -i "$1" -vcodec h264 -vf scale=720:-1 -af "volume=10dB" "$1".mp4
}
