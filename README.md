# LinuxBozo's dotfiles 
* Based on [Mathis Bynens](http://github.com/mathiasbynens/dotfiles) dotfiles setup
* Designed with OSX in mind
* Targetted mainly toward python/groovy/grails development
* Assumes you work with git and svn

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`) The bootstrapper script will pull in the latest version and symlink the files to your home folder.

```bash
git clone https://github.com/LinuxBozo/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
./bootstrap.sh -f
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/LinuxBozo/dotfiles/fork_select) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

Definitely, you'll want to grab [Homebrew](http://mxcl.github.com/homebrew/). This is like macports, but IMHO, better.
When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course). This little script will do it all for you:

```bash
./.brew
```
