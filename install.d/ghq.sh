#!/bin/bash

GHQ_INSTALL_LIST=$(echo '
junegunn/fzf
lysyi3m/osx-terminal-themes
motemen/ghq
yyuu/pyenv
yyuu/pyenv-virtualenv
github.com/vimpr/vimperator-colors
' | xargs)

for p in $GHQ_INSTALL_LIST; do
  ghq get $p
done

$HOME/src/github.com/junegunn/fzf/install --all
