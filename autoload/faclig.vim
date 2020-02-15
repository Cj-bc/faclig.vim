let g:faclig#face_pane = 'left-of'
let g:faclig#autoBlink#interval = 5 " second
let g:faclig#shscript = expand('<sfile>:p:h') . '/../tool/auto-blink.sh'



" Start blinking
function! faclig#startBlinking()
  let b:blinkingJob = job_start('bash ' . g:faclig#shscript . ' ' . g:faclig#autoBlink#interval)
endfunction

" Stop blinking if job exist
function! faclig#stopBlinking()
  if exists('b:blinkingJob')
    call job_stop(b:blinkingJob, 30)
  endif
endfunction


" Send key to the pane
"
" If auto-blinking is running, stop it
function! faclig#sendKey(place, key)
  if exists('b:blinkingJob')
    StopBlinking
  endif

  call system('tmux send -t {' . a:place . '} ' . a:key)
endfunction

function! faclig#enableFace()
  nmap <silent> w :call faclig#sendKey(g:faclig#face_pane, 'w')<CR>
  nmap <silent> e :call faclig#sendKey(g:faclig#face_pane, 'e')<CR>
  nmap <silent> r :call faclig#sendKey(g:faclig#face_pane, 'r')<CR>
  nmap <silent> s :call faclig#sendKey(g:faclig#face_pane, 's')<CR>
  nmap <silent> d :call faclig#sendKey(g:faclig#face_pane, 'd')<CR>
  nmap <silent> f :call faclig#sendKey(g:faclig#face_pane, 'f')<CR>
  nmap <silent> c :call faclig#sendKey(g:faclig#face_pane, 'c')<CR>
  nmap <silent> x :call faclig#sendKey(g:faclig#face_pane, 'x')<CR>
  nmap <silent> b :call faclig#sendKey(g:faclig#face_pane, 'b')<CR>
  nmap <silent> n :call faclig#sendKey(g:faclig#face_pane, 'n')<CR>
  nmap <silent> m :call faclig#sendKey(g:faclig#face_pane, 'm')<CR>
  nmap <silent> h :call faclig#sendKey(g:faclig#face_pane, 'h')<CR>
  nmap <silent> l :call faclig#sendKey(g:faclig#face_pane, 'l')<CR>
  nmap <silent> o :call faclig#sendKey(g:faclig#face_pane, 'o')<CR>
  nmap <silent> q :call faclig#sendKey(g:faclig#face_pane, 'q')<CR>
  nmap <silent> <F1> :call faclig#sendKey(g:faclig#face_pane, 'wem')<CR> " Emotion: Neutral
  nmap <silent> <F2> :call faclig#sendKey(g:faclig#face_pane, 'sdm')<CR> " Emotion: Close
  nmap <silent> <F3> :call faclig#sendKey(g:faclig#face_pane, 'xcb')<CR> " Emotion: Surprised
  nmap <silent> <F4> :call faclig#sendKey(g:faclig#face_pane, 'rfn')<CR> " Emotion: Smile
  nmap <silent> <F5> :call faclig#sendKey(g:faclig#face_pane, 'wdn')<CR> " Emotion: Blink

  nmap <silent> <leader>1 :call faclig#disableFace()<CR>
endfunction

function! faclig#disableFace()
  nunmap w
  nunmap e
  nunmap r
  nunmap s
  nunmap d
  nunmap f
  nunmap c
  nunmap x
  nunmap b
  nunmap n
  nunmap m
  nunmap h
  nunmap l
  nunmap o
  nunmap <leader>1
  nunmap <F1>
  nunmap <F2>
  nunmap <F3>
  nunmap <F4>
  nunmap <F5>
  nmap <silent> <leader>1 :call faclig#enableFace()<CR>
endfunction


