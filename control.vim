let g:face_pane = 'left-of'
let g:oniOrHuman_pane = 'bottom'
let g:interval = 5 " second
let s:script_dir = expand('<sfile>:p:h') "

" Start winking
function! s:startWinking()
  let b:winkingJob = job_start('bash ./auto-wink.sh ' . g:interval)
endfunction

" Stop winking if job exist
function! s:stopWinking()
  if exists(b:winkingJob)
    call job_stop(b:winkingJob, 30)
  endif
endfunction


" Send key to the pane
"
" If auto-winking is running, stop it
function s:sendKey(place, key)
  if exists(b:winkingJob)
    StopWinking
  endif

  call system('tmux send -t {' . a:place . '} ' . a:key)
endfunction

function! s:enableFace()
  nmap <silent> w :call <SID>sendKey(g:face_pane, 'w')<CR>
  nmap <silent> e :call <SID>sendKey(g:face_pane, 'e')<CR>
  nmap <silent> r :call <SID>sendKey(g:face_pane, 'r')<CR>
  nmap <silent> s :call <SID>sendKey(g:face_pane, 's')<CR>
  nmap <silent> d :call <SID>sendKey(g:face_pane, 'd')<CR>
  nmap <silent> f :call <SID>sendKey(g:face_pane, 'f')<CR>
  nmap <silent> c :call <SID>sendKey(g:face_pane, 'c')<CR>
  nmap <silent> x :call <SID>sendKey(g:face_pane, 'x')<CR>
  nmap <silent> b :call <SID>sendKey(g:face_pane, 'b')<CR>
  nmap <silent> n :call <SID>sendKey(g:face_pane, 'n')<CR>
  nmap <silent> m :call <SID>sendKey(g:face_pane, 'm')<CR>
  nmap <silent> h :call <SID>sendKey(g:face_pane, 'h')<CR>
  nmap <silent> l :call <SID>sendKey(g:face_pane, 'l')<CR>
  nmap <silent> o :call <SID>sendKey(g:face_pane, 'o')<CR>
  nmap <silent> q :call <SID>sendKey(g:face_pane, 'q')<CR>
  nmap <silent> <F1> :call <SID>sendKey(g:face_pane, 'wem')<CR> " Emotion: Neutral
  nmap <silent> <F2> :call <SID>sendKey(g:face_pane, 'sdm')<CR> " Emotion: Close
  nmap <silent> <F3> :call <SID>sendKey(g:face_pane, 'xcb')<CR> " Emotion: Surprised
  nmap <silent> <F4> :call <SID>sendKey(g:face_pane, 'rfn')<CR> " Emotion: Smile
  nmap <silent> <F5> :call <SID>sendKey(g:face_pane, 'wdn')<CR> " Emotion: Wink

  nmap <silent> <Space> :call <SID>sendKey(g:oniOrHuman_pane, "\" \"")<CR>
  nmap <silent> <leader>1 :call <SID>disableFace()<CR>
endfunction

function! s:disableFace()
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
  nunmap <Space>
  nmap <silent> <leader>1 :call <SID>enableFace()<CR>
endfunction

" Remove my own maps in order to detect 's' mapping faster
nunmap sa
nunmap sd
nunmap sr
call s:enableFace()
call s:disableFace()


command StartWinking call s:startWinking()
command StopWinking  call s:stopWinking()


