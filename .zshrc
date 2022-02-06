# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/luccui/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias mw='env GTK_THEME=Adwaita mysql-workbench'
alias pa='php artisan'
alias gp='git push origin main'
alias www='cd /var/www/html'
alias rcc='pa route:clear && pa route:cache'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias artisan='sail artisan'
alias burp='/opt/burpsuite_pro_v2021.8/burp && disown'
alias phpconf='sudo update-alternatives --config php'
alias python='/usr/bin/python3.9'
alias inkscape='env GTK_THEME=Adwaita inkscape'
alias webstorm='/opt/Webstorm/bin/webstorm.sh'
alias open='xdg-open'
alias prl='php artisan route:list --columns=method,name,uri'
alias html='touch index.html style.css main.js'

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export JRE_HOME='/usr/lib/jvm/java-8-openjdk-amd64/jre'
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# function
dbcreate() {
	mysql -u root -e "create database $1;"
}

createhost() {
	sudo cp /etc/nginx/sites-available/local.conf /tmp/${1}.conf
	sudo sed -i "s/joomla/${1}/g" /tmp/${1}.conf
	sudo cp /tmp/${1}.conf /etc/nginx/sites-available/
	sudo ln -s /etc/nginx/sites-available/${1}.conf /etc/nginx/sites-enabled
	sudo rm /tmp/${1}.conf
	sudo echo "127.0.0.1		${1}.local" >> /etc/hosts
	sudo nvim /etc/nginx/sites-available/${1}.conf
	sudo systemctl restart nginx
	sudo systemctl restart apache2
}

4to3() {
	if [ -f "$1" ]; then
		fileName="$(cut -d '.' -f1 <<< $1)"
		ffmpeg -i $1 -vn -acodec libmp3lame -ac 2 -ab 160k "$fileName.mp3" 
	else 
		echo "File not found"
	fi
}

ulimit -s 200012



export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
