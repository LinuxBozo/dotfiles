# Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Git prompt
[[ $- == *i* ]]  &&  source $HOME/.git-prompt.sh

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Common junk
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
