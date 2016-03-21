#!/bin/sh
export PATH=$PATH:/usr/local/bin
. ../system/generate-name.sh

# abort if already inside a TMUX session
[ "$TMUX" == "" ] || exit 0

# Startup a "primary-session" session in detached mode if none currently exists
tmux has-session -t primary-session || tmux new-session -s primary-session -d

options=("new-session" "no-session" $(tmux list-sessions -F "#S"))
options_length=${#options[@]}

clear
printf "$(tput setaf 2)Ongoing sessions [$((options_length - 2))]:$(tput sgr0)"
printf "\t $(tput setaf 9)(1) ${options[0]}$(tput sgr0)    \n"
for i in $(seq 1 $((options_length - 1))); do
  printf "\t\t\t $(tput setaf 9)($((i + 1))) ${options[$i]}$(tput sgr0)    \n"
done
echo
read -p "$(tput setaf 4)Please choose your session (defaults to new-session): $(tput sgr0)" session_in
session_in=${session_in:-1}

case $session_in in
  "1")
    name=$(generate_name)
    tmux new -s "$name"
    break
    ;;
  "2")
    zsh --login
    break
    ;;
  *)
    case $session_in in
      ''|*[!0-9]*)
        tmux attach-session -t $session_in
        ;;
      *)
        tmux attach-session -t ${options[$((session_in - 1))]}
        ;;
    esac
    break
    ;;
esac
