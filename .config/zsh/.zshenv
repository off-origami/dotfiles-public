# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Load Nix profile if it exists
if [ -e /home/baskakovihor/.nix-profile/etc/profile.d/nix.sh ]; then . /home/baskakovihor/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Set locale archive path
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

# Set NVM directory and load NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
