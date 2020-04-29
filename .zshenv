export LESS=eFRX

# Alias commands

alias bx='bundle exec'
alias cdd="cd ../ && cd -"
alias clear_all_logs="find ~/ -iname '*.log' -exec dd if=/dev/null of={} \;"

alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_remove_all_branches_but_master='git branch | grep -v "master" | xargs git branch -D && git fetch --prune --all'
alias git_update_sub_folders='for REPO in `ls`; do (cd "$REPO"; git pull); done;'
alias git_add_to_last_commit='git commit --amend -C HEAD --no-verify'

alias tails='tail -f log/development.log'
alias puma_logs='tail -f ~/Library/Logs/puma-dev.log'

# Docker Commands
alias dcu='docker-compose up'
alias dcr='docker-compose run --rm --no-deps web'
alias dcd='docker-compose down'

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


# Run Spec / Test (Or last test)
# run_ruby_tests spec/path_to_test.rb:line_number
run_ruby_tests() {
  SPECPATH=$1;

  if [[ $SPECPATH != spec* && $SPECPATH != test* ]]; then
    SPECPATH=`cat ~/.run_ruby_tests`;
    echo "Testing: $SPECPATH";
  else
    echo $1 > ~/.run_ruby_tests
  fi

  if [[ $SPECPATH = spec* ]]; then
    docker-compose run --rm --no-deps web bundle exec rspec --no-color $SPECPATH;
  elif [[ $SPECPATH = test* ]]; then
    docker-compose run --rm --no-deps web bundle exec rails test --no-color $SPECPATH;
  fi
}
