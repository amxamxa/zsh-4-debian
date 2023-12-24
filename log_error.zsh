#!/usr/bin/env zsh
# log_error.zsh
# in gleichem Terminal: less -F ~/"$(ZDOTDIR)"/error-log.txt
# in separaten Terminal: tail -f ~/"$(ZDOTDIR)"/error-log.txt

log_error() 
{
 local error_message
  # if" statement checks if the exit code of the last command is 
  # not equal to 0 (meaning the command failed)
  if [ $? -ne 0 ]; then
   error_message="$(cat /dev/stdout)"
   error_message+="$(cat /dev/stderr)"
   # combined output of stdout and stderr
   echo "$(date +%F+%X) $(fc -ln -1) $error_message" >> $ZDOTDIR/log_error/$(date +%F)_log_error.txt
 fi
}



