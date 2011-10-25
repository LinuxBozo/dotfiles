# Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Common junk
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
