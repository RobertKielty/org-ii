#!/bin/bash
set -x
orgfile=$1
BASE=$(basename $orgfile)
tmate -S /tmp/${USER}.${BASE}.iisocket new-session \
      -A -s $USER -n emacs \
      "tmate wait tmate-ready \
&& TMATE_CONNECT=\$(tmate display -p '#{tmate_ssh} # ${USER}.${BASE} # #{tmate_web}') \
; (echo \$TMATE_CONNECT | xclip -i -sel p -f | xclip -i -sel c -f)2>/dev/null \
|| echo \$TMATE_CONNECT \
; echo Share the above with your friends and hit enter here when done? \
; read ; \
emacs -nw $1"
