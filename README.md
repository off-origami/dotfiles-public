# off-origami's dotfiles

## Contents

- Neovim config
- PowerShell setup (Windows)
- Docker setup (WSL2)

## Neovim (Setup on Debian with nix package manager + config) 

### Install Nix
```bash
curl -L https://nixos.org/nix/install | sh
```
restart your terminal
#### To solve problems with locales (following this: https://nixos.wiki/wiki/Locales)
```bash
nix-env -iA nixpkgs.glibcLocales

# in your .zshenv (zsh) or .profile (bash)
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

# in ~
vim shell.nix

# inside shell.nix
with import <nixpkgs> {};  
pkgs.mkShell {
  LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  # You can also include other build inputs as needed
  buildInputs = [ hello ];

nix-shell
```

### Install Neovim using Nix
```bash
nix-env -iA nixpkgs.neovim
nvim --version
nix-env -iA nixpkgs.gcc
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.fd
git --version

# Nerd Font
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

# lazyvim
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}  # Optional
mv ~/.local/state/nvim{,.bak}  # Optional
mv ~/.cache/nvim{,.bak}        # Optional

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

nvim

# inside nvim
:checkhealth

# Installing a Clipboard Tool
nix-env -iA nixpkgs.xsel
```
The rest in my dotfiles.

## PowerShell setup (Windows)

- [Scoop](https://scoop.sh/) - A command-line installer
- [Git for Windows](https://gitforwindows.org/)
- [Oh My Posh](https://ohmyposh.dev/) - Prompt theme engine
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) - Folder and file icons
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) - Cmdlets for customizing the editing environment, used for autocompletion
- [z](https://www.powershellgallery.com/packages/z) - Directory jumper
- [PSFzf](https://github.com/kelleyma49/PSFzf) - Fuzzy finder

## Docker setup (WSL2)

### wsl2

```powershell
#by default will be wsl2 and ubuntu
wsl --install
```

### Install Docker & Docker-compose on Ubuntu
```bash
#refresh and install packages
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#add user group
sudo groupadd docker
sudo usermod -aG docker ${USER}

#add docker key and repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \ "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#install docker and docker-compose
sudo apt-get install -y docker-ce docker-compose

#verifying installation
docker --version
docker-compose --version

#docker will run on startup by default
```

### Limit resources
1. Enter the user's folder: %USERPROFILE%
2. Create the file: .wslconfig
3. Enter the following:
```properties
[wsl2]
memory=4GB # Adjust based on your total system RAM (most of the time totalRam / 2)
processors=2 # Adjust based on your CPU's total core count (also totalCPU / 2)
swap=1GB # Optional: Adjust based on your needs and available disk space (1-2GB its a standart)
```
4. Go to powershell and restart wsl
```powershell
wsl --shutdown
wsl
```
5. Monitor resource usage from time to time and if needed adjust .wslconfig
