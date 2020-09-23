# install git
sudo apt install git curl wget 

# install neovim 
sudo apt install neovim

# install && setting ibus-bamboo
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
ibus restart

#make firefox look like safari on MacOS
git clone https://github.com/rafaelmardojai/firefox-gnome-theme/ && cd firefox-gnome-theme
./scripts/install.sh # Standard

# detail: https://github.com/rafaelmardojai/firefox-gnome-theme
	
# setup theme & icons
sudo apt install gnome-tweaks
# wget https://www.pling.com/p/1400988

# config nvim

# B1:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# install nvm manage node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#Create Window 10 bootable
sudo apt install wimtools
sudo apt update
# boot window 10 iso
# https://drive.google.com/uc?id=1imXpNAIJoa11sL3SOpCXBgxRwEGTuExw&export=download
