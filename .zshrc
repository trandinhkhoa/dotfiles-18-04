# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH

#for python site packages (e.g. for youcompleteme to work with python site packages (e.g. numpy)
# to find the correct path, do `pip3 show numpy`
export PYTHONPATH=$HOME/.local/lib/python3.6/site-packages

# Path to your oh-my-zsh installation.
export ZSH="/home/khoa/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    vi-mode
    colored-man-pages
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# display powerline for zsh
# source /home/khoa/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

LS_COLORS=$LS_COLORS:'ow=0;35:' ; export LS_COLORS

# uncomment this to hide @machinename
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# hide user@machinename
DEFAULT_USER=$USER

# vi-mode
# =======
# This plugin increase `vi-like` zsh functionality.
#
# Use `ESC` or `CTRL-[` to enter `Normal mode`.
#
#
# History
# -------
#
# - `ctrl-p` : Previous command in history
# - `ctrl-n` : Next command in history
# - `/`      : Search backward in history
# - `n`      : Repeat the last `/`
#
#
# Mode indicators
# ---------------
#
# *Normal mode* is indicated with red `<<<` mark at the right prompt, when it
# wasn't defined by theme.
#
#
# Vim edition
# -----------
#
# - `v`   : Edit current command line in Vim
#
#
# Movement
# --------
#
# - `$`   : To the end of the line
# - `^`   : To the first non-blank character of the line
# - `0`   : To the first character of the line
# - `w`   : [count] words forward
# - `W`   : [count] WORDS forward
# - `e`   : Forward to the end of word [count] inclusive
# - `E`   : Forward to the end of WORD [count] inclusive
# - `b`   : [count] words backward
# - `B`   : [count] WORDS backward
# - `t{char}`   : Till before [count]'th occurrence of {char} to the right
# - `T{char}`   : Till before [count]'th occurrence of {char} to the left
# - `f{char}`   : To [count]'th occurrence of {char} to the right
# - `F{char}`   : To [count]'th occurrence of {char} to the left
# - `;`   : Repeat latest f, t, F or T [count] times
# - `,`   : Repeat latest f, t, F or T in opposite direction
#
#
# Insertion
# ---------
#
# - `i`   : Insert text before the cursor
# - `I`   : Insert text before the first character in the line
# - `a`   : Append text after the cursor
# - `A`   : Append text at the end of the line
# - `o`   : Insert new command line below the current one
# - `O`   : Insert new command line above the current one
#
#
# Delete and Insert
# -----------------
#
# - `ctrl-h`      : While in *Insert mode*: delete character before the cursor
# - `ctrl-w`      : While in *Insert mode*: delete word before the cursor
# - `d{motion}`   : Delete text that {motion} moves over
# - `dd`          : Delete line
# - `D`           : Delete characters under the cursor until the end of the line
# - `c{motion}`   : Delete {motion} text and start insert
# - `cc`          : Delete line and start insert
# - `C`           : Delete to the end of the line and start insert
# - `r{char}`     : Replace the character under the cursor with {char}
# - `R`           : Enter replace mode: Each character replaces existing one
# - `x`           : Delete [count] characters under and after the cursor
# - `X`           : Delete [count] characters before the cursor
