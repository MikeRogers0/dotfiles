export LESS=eFRX

# zsh calls compinit a lot, so disabling it to make things faster
export skip_global_compinit=1

# Alias commands

alias bx='bundle exec'
alias cdd="cd ../ && cd -"
alias clear_all_logs="find ~/ -iname '*.log' -exec dd if=/dev/null of={} \;"

alias git_cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_remove_all_branches_but_master='git branch | grep -v "master" | xargs git branch -D && git fetch --prune --all'
alias git_update_sub_folders='for REPO in `ls`; do (cd "$REPO"; git pull); done;'

alias tails='tail -f log/development.log'
alias puma_logs='tail -f ~/Library/Logs/puma-dev.log'

alias git-churn="git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort -n"

# Docker Commands
alias dcu='docker-compose up  --remove-orphans'
alias dcr='docker-compose run --rm --no-deps web'
alias dce='docker-compose exec web'
alias dcd='docker-compose down'
alias docker-clean='docker image prune'
alias docker-cleanup='docker rmi $(docker images -q) --force'

# MacOS Commands
alias spotlight_off='sudo mdutil -i off'
alias spotlight_on='sudo mdutil -i on'

# Disable Spring - Especially in Dockerland it adds no value
export DISABLE_SPRING=1

# Docker Image commands
here-ruby() {
  docker run --rm -it -p 8080:8080 -e HOST_PWD=$(pwd) -v $(pwd):/usr/src/app ruby:2.7.1-alpine /bin/sh -c 'cd /usr/src/app && sh'
}

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

  if [[ $SPECPATH != *_spec* && $SPECPATH != *_test* ]]; then
    SPECPATH=`cat ~/.run_ruby_tests`;
    echo "Testing: $SPECPATH";
  else
    echo $1 > ~/.run_ruby_tests
  fi

  if [[ $SPECPATH = *_spec* ]]; then
    bundle exec rspec --no-color $SPECPATH;
    # docker-compose run --rm --no-deps web bundle exec rspec --no-color $SPECPATH;
  elif [[ $SPECPATH = *_test* ]]; then
    bundle exec rails test --no-color $SPECPATH;
    # docker-compose run --rm --no-deps web bundle exec rails test --no-color $SPECPATH;
  fi
}

# Configure Python
export PYTHON_CONFIGURE_OPTS="--enable-framework"
