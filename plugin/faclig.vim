call faclig#enableFace()
call faclig#disableFace()

command StartBlinking call faclig#startBlinking()
command StopBlinking  call faclig#stopBlinking()

au VimLeavePre * call faclig#stopBlinking()
