# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
echo "You've Hit:
"
figlet Bedrock
neofetch --backend off

alias display='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 143.98'
alias hackans='ssh root@194.168.1.56'
alias void='strat void'
alias arch='strat arch'
