function continueWink() {
  trap 'exit; trap 30' 30
  local -i interval=$1

  tmux send -t {left-of} 'sd'
  sleep 0.3
  tmux send -t {left-of} 'we'
  sleep $interval

  continueWink $interval
}

continueWink $1
