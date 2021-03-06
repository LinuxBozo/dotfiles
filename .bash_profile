# shellcheck shell=bash

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,bash_prompt,aliases,functions,extra}; do
  # shellcheck source=/dev/null
  [ -r "$file" ] && source "$file"
done
unset file

# Update window size after every command
shopt -s checkwinsize
# Save multi-line commands as one command
shopt -s cmdhist

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Prepend cd to directory names automatically
shopt -s autocd 2>/dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell
# Autocorrect typos in path names when using `cd`
shopt -s cdspell 2>/dev/null

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2>/dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
if which brew >/dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  # shellcheck source=/dev/null
  source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
  # shellcheck disable=SC1091
  source /etc/bash_completion
fi

# Parse gpg agent info
if ! pgrep gpg-agent >/dev/null 2>&1; then
  eval "$(gpg-agent --daemon --enable-ssh-support)"
fi
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

# shellcheck source=/dev/null
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# shellcheck source=/dev/null
source "$HOME/.cargo/env"
