FACLIG_AUTOBLINK_INTERVAL=$1

function continueWink() {
  export FACLIG_AUTOBLINK_INTERVAL=$1
  local -i interval=$1

  tmux send -t {left-of} 'sd'
  sleep 0.3
  tmux send -t {left-of} 'we'
  sleep $interval

  continueWink $interval
}

function startBlinking() {
  continueWink $1 &
  export FACLIG_AUTOBLINK_PID=$!
}
function stopBlinking() { kill $FACLIG_AUTOBLINK_PID; unset FACLIG_AUTOBLINK_PID; }
function pauseBlinkingFor() {
  [[ -v FACLIG_AUTOBLINK_INTERVAL ]] \
    && local interval=${FACLIG_AUTOBLINK_INTERVAL} \
    || local interval=10

  stopBlinking
  sleep $1
  startBlinking $interval
}


startBlinking $FACLIG_AUTOBLINK_INTERVAL
