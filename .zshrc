# LANG
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# emacs like keybind
bindkey -e

autoload -U compinit
compinit

# Ruby Gems
export BUNDLER_EDITOR=emacs
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
 #auto-change capital letter to small letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# auto-complete
setopt auto_cd
cdpath=(.. ~ ~/src)
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt NO_HUP

setopt no_nomatch

#autoload predict-on
#predict-on


# PROMPT
PROMPT="$ "
RPROMPT="%~"
SPROMPT="correct: %R -> %r ? "
PROMPT2="$ "
SPROMPT="zsh: %r is correct? [n,y,a,e]: "

# Terminal Title
#precmd() {
#    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#}
#;;



zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# History Size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#setopt hist_ignore_dups     # ignore duplication command history list
#setopt share_history        # share command history data


# git current dir
# http://d.hatena.ne.jp/uasi/20091017/1255712789
autoload -U colors; colors

function rprompt-git-current-branch {
        local name st color

        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        echo "%{$color%}$name%{$reset_color%} "
}
setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`%~]'

# Alias
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
# alias octave='/Applications/Octave.app/Contents/Resources/bin/octave'
# alias gnuplot='/Applications/Gnuplot.app/Contents/Resources/bin/gnuplot'
# alias gitx='/Applications/GitX.app/Contents/Resources/gitx'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# export LSCOLORS=Cxgxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# STARTFGCOLOR='\e[0;34m';
# STARTBGCOLOR="\e[47m"
# ENDCOLOR="\e[0m"
# export PS1="$STARTFGCOLOR$STARTBGCOLOR\u@\h \w> $ENDCOLOR"
PROMPT="%F{red}%K{white}$%k%f "
alias o="open ."
alias l="ls"
alias gist="git status"
alias gisp="git stash pop stash@{0}"
alias giff="git diff"

alias ls='ls -G -w'
##alias ls='ls --color'
alias gls="gls --color"
alias la="ls -la"
alias lg="ls -g"
alias ll="ls -l"

alias be="bundle exec"

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
atom=/Applications/Atom.app/Contents/MacOS/Atom
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:$HOME
eval "$(pyenv init -)"

# aliases
alias c="cd"
alias l="/bin/ls -G"
alias ls="ls -F -l -t -G"
alias ll="ls -al -G"

alias gist="git status"
alias giff="git diff"
alias gisp="git stash pop stash@{0}"

alias o="open ."
alias ocaml="rlwrap ocaml"
