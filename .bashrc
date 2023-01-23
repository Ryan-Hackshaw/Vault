# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
echo "You've Hit:
"
figlet Bedrock
neofetch --backend off

# Bedrock
alias void='strat void'
alias arch='strat arch'

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# basic
alias display='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 143.98'

# docker alias'
alias lsdocker='sudo docker ps'
alias hackrun='sudo docker start hack'
alias hackstop='sudo docker stop hack'
alias hackbash='sudo docker exec -it hack bash'
alias plexrun='sudo docker start plex'
alias plexstop='sudo docker stop hack'
alias plexbash='sudo docker exec -it plex bash'
alias docrun='sudo docker start doc'
alias docstop='sudo docker stop doc'
alias docbash='sudo docker exec -it doc bash'
alias docsh='sudo docker exec -it doc sh'
alias matrixrun='sudo docker start matrixhomeserver'
alias matrixstop='sudo docker stop matrixhomeserver'
alias matrixbash='sudo docker exec -it matrixhomeserver bash'
alias beefbuild='sudo docker run --rm -it --net=host -v $HOME/.msf4:/root/.msf4:Z -v /tmp/msf:/tmp/data:Z --name=beef phocean/beef'
alias beefrun='sudo docker start beef'
alias beefstop='sudo docker stop beef'
alias browserun='sudo docker run --rm -it browsh/browsh'
# ssh alias'
alias hacknas='sudo ssh root@192.168.1.56'
alias irh='sudo ssh isabella@101.173.32.198'
alias tor='sudo ssh ryanh@192.168.1.65'
alias web='sudo ssh ryanh@192.168.1.221'
