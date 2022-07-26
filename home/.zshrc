
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH_PATH1="/usr/share/oh-my-zsh"
ZSH_PATH2="$HOME/.oh-my-zsh"
if [ -e $ZSH_PATH1 ]; then
	export ZSH=$ZSH_PATH1
elif [ -e $ZSH_PATH2 ]; then
	export ZSH=$ZSH_PATH2
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="muse"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(
	git
	autojump
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# let auto complete behave like bash
setopt noautomenu

# do not share history in diff session
unsetopt share_history

# shortcut act like bash (command `bindkey` show all)
bindkey \^U backward-kill-line

# history act like bash
bindkey "$terminfo[kcuu1]" up-history
bindkey "$terminfo[kcud1]" down-history

# load gitflow-zshcompletion
source /usr/share/zsh/site-functions/git-flow-completion.zsh

# my theme (edit from muse/af-magic) {

# let diff hostname show diff color
__HOST_SYMB_LIST=("\u2764" "\u2605" "\u25C8" "\u263B" "\u2618" "\u2622" "\u26A1" "\u2602" "\u2708" "\u10005" "\u2117" "\u0099" "\u00B6" "\u211E" "\u27A4" "\u21BB" "\u21C5")
__HOST_SHA=$(hostname | cksum | awk '{print $1}')
HOST_COLOR=0$(echo "$__HOST_SHA % 6 + 31" | bc)
HOST_SYMB=$(echo "$__HOST_SHA % ${#__HOST_SYMB_LIST[*]} + 1" | bc)
HOST_SYMB=$(echo "${__HOST_SYMB_LIST[$HOST_SYMB]}")

__showname() {
    echo "%{$FG[$HOST_COLOR]%}%n${FG[077]}@%{$FG[$HOST_COLOR]%}%M"
}
PROMPT="[ $(__showname):${FG[117]}%~%{$reset_color%} ] $(git_prompt_info)$(virtualenv_prompt_info)${FG[133]}$(git_prompt_status)
${FG[$HOST_COLOR]}$HOST_SYMB%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[012]}("
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[012]})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${FG[133]}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${FG[118]}✔"

ZSH_THEME_GIT_PROMPT_ADDED="${FG[082]}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[166]}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="${FG[160]}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="${FG[220]}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[082]}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${FG[190]}✭%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=" ["
ZSH_THEME_VIRTUALENV_SUFFIX="]"
# } my theme end

if [[ -e /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ -e ~/.zsh/bd.zsh ]]; then
  source ~/.zsh/bd.zsh
fi

if [[ -e ~/.shell_configs ]]; then
  source ~/.shell_configs
fi


