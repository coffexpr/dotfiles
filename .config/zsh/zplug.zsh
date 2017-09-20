if [ ! -d $ZPLUG_HOME ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-completions"
# zplug "felixr/docker-zsh-completion"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "hchbaw/opp.zsh"
# zplug "aws/aws-cli", use:bin/aws_zsh_completer.sh, on:"zsh-users/zsh-completions", defer:2
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug "$ZDOTDIR", from:local, use:"func.zsh"
zplug "$ZDOTDIR", from:local, use:anyframe.zsh, on:"mollifier/anyframe"

case ${OSTYPE} in
  darwin*)
    zplug "$ZDOTDIR/darwin.zsh", from:local
    ;;
  linux*)
    zplug "$ZDOTDIR/linux.zsh", from:local
    ;;
  msys*)
    zplug "$ZDOTDIR/msys.zsh", from:local
    ;;
esac

zplug load

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'
bindkey ' ' autosuggest-accept
