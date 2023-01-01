# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="archcraft"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

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
alias i3edit= 'vim /home/ryanh/.config/i3/config'
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
# scripts
alias quote='python3 /home/ryanh/Documents/Scripts/quotes.py'
# Hacking
 # handbook
alias tools='source /home/ryanh/.hackingtools'
alias if-then-else='source /home/ryanh/Documents/Personal/Subjects/IT/Cybersecurity/HackingHandbook/If-Then-Else'
alias while-until-loops='source /home/ryanh/Documents/Personal/Subjects/IT/Cybersecurity/HackingHandbook/While-Until-Loops'
alias for-loops='source /home/ryanh/Documents/Personal/Subjects/IT/Cybersecurity/HackingHandbook/For-Loops'
 # bettercap
alias caplet='sudo bettercap -iface enp7s0 -caplet /home/ryanh/Documents/caplet.cap'


figlet RMH
echo "Owned by Ryan Maxwell Hackshaw

####Hostnames#############Dockernames#################
|  hacknas            |  beef                        |
|  irh                |  doc (sh, bash)              |
|  tor                |  hack (bash)                 |
|  web                |  matrix (bash)               |
|                     |  plex (bash)                 |
|                     |  browser (browsh)            |
####Special Comands###################################
|  IT                = cd into IT                    |
|  display           = changes display               |
|  [dockername]run   = starts [dockername]           |
|  [dockername]stop  = stops [dockername]            |
|  [dockername]bash  = executes bash on [dockername] |
|  [dockername]sh    = executes sh on [dockername]   |
|  [hostname]        = ssh into [hostname]           |
|  lsdocker          = list all dockers              |
|  tools             = list hacking tools            |
######################################################
"


