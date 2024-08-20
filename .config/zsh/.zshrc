# Starship
eval "$(starship init zsh)" 

# Enable zsh-syntax-highlighting
source $HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable the underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Enable zsh-autosuggestions
source $HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ll='ls -alF'
