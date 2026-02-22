#!/bin/bash 
# ╔═════════════════════════════════════════════════════╗
# ║   The owner command by Ly Leangseng  26/11/2025     ║
# ╚═════════════════════════════════════════════════════╝
sudo apt update && sudo apt upgrade -y
which zsh || {
    # ╔═════════════════════════════════════════╗
    # ║   Install ZSH with no required y/n      ║
    # ╚═════════════════════════════════════════╝
    sudo apt install zsh -y
    echo "Zsh not found. Installing Zsh... 👽"

    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" #//----variable for zsh
    export RUNZSH=no #//tell the zsh don't auto run when it finished

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # ╔═════════════════════════════════════════╗
    # ║   Clone Git autosuggestions by ZSH      ║
    # ╚═════════════════════════════════════════╝
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        echo "✅Adding'zsh-autosuggestions' "
	    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    fi


    # ╔═════════════════════════════════════════════════╗
    # ║   Clone Git zsh-syntax-highlighting by ZSH      ║
    # ╚═════════════════════════════════════════════════╝
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        echo " ✅ Adding 'zsh-syntax-highlighting'... "
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    fi

    sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc #Modify text inside (git) by our plugin
    echo " Zsh plugins installed and configured successfully. 🤞🎉🎉🎉"
    zsh
}
