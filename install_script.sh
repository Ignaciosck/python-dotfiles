#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install necessary tools (git, curl, etc.)
echo "Installing basic tools..."
sudo apt install -y git curl wget unzip tmux build-essential

# Install Zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt install -y zsh
else
    echo "zsh is already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Set zsh as the default shell for the current user
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(command -v zsh)" "$USER"
fi

# Install other necessary programs
echo "Installing additional tools..."

# Install Neovim from official repository
echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Install Stow
sudo apt install -y stow

# Install Python3 and pip
sudo apt install -y python3 python3-pip

# Install fnm (Node.js version manager)
if ! command -v fnm &> /dev/null; then
    echo "Installing fnm (Fast Node Manager)..."
    curl -fsSL https://fnm.vercel.app/install | bash

    # Load fnm into the current script session with the correct path
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env)"

    # Add fnm initialization to .zshrc and .bashrc for future sessions
    if ! grep -q 'export PATH="$HOME/.local/share/fnm"' ~/.zshrc; then
        echo 'export PATH="$HOME/.local/share/fnm:$PATH"' >> ~/.zshrc
        echo 'eval "$(fnm env)"' >> ~/.zshrc
    fi

    if ! grep -q 'export PATH="$HOME/.local/share/fnm"' ~/.bashrc; then
        echo 'export PATH="$HOME/.local/share/fnm:$PATH"' >> ~/.bashrc
        echo 'eval "$(fnm env)"' >> ~/.bashrc
    fi

    # Install Node.js LTS using fnm
    fnm install --lts
# Install Node.js LTS using fnm
   sudo -u "$SUDO_USER" fnm install --lts
fi

# Install fzf
if ! command -v fzf &> /dev/null; then
    echo "Installing fzf..."
    sudo apt install -y fzf
fi

# Install ripgrep
if ! command -v rg &> /dev/null; then
    echo "Installing ripgrep..."
    sudo apt install -y ripgrep
fi

# Install wezterm using APT repository
if ! command -v wezterm &> /dev/null; then
    echo "Adding wezterm APT repository..."
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo apt update
    echo "Installing wezterm..."
    sudo apt install -y wezterm
else
    echo "wezterm is already installed."
fi

# Install Nerd Font (SourceCodePro)
echo "Installing SourceCodePro Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip
unzip -o SourceCodePro.zip -d "$FONT_DIR"
rm SourceCodePro.zip

# Refresh font cache
echo "Refreshing font cache..."
fc-cache -fv

# Add PATH updates to .zshrc
echo "Updating PATH in .zshrc..."
cat << 'EOF' >> ~/.zshrc

# Add custom directories to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
EOF

# Install zsh-autocomplete
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autocomplete" ]; then
    echo "Installing zsh-autocomplete plugin..."
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM}/plugins/zsh-autocomplete
else
    echo "zsh-autocomplete is already installed."
fi

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Add plugins to .zshrc
if ! grep -q "zsh-autocomplete" ~/.zshrc; then
    echo "Adding plugins to .zshrc..."
    sed -i 's/plugins=(/plugins=(zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc
fi

echo "Installation of dependencies completed! Installing dotfiles..."

# Variables
DOTFILES_REPO="https://github.com/Ignaciosck/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# Clone dotfiles repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists."
fi

cd "$DOTFILES_DIR" || exit

# stow directories only inside dotfiles dir
for dir in */; do
    dir_name=$(basename "$dir")
    stow -d "$DOTFILES_DIR" -t "$HOME" "$dir_name"
done
echo "Dotfiles have been applied successfully."

# Install required packages for Docker
echo "Installing certificates and curl..."
sudo apt-get install -y ca-certificates curl

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "Adding Docker repository to Apt sources..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again
sudo apt-get update

# Download Docker Desktop .deb file
echo "Downloading Docker Desktop .deb file..."
curl -LO https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb

# Install Docker Desktop
echo "Installing Docker Desktop..."
sudo apt-get install -y ./docker-desktop-amd64.deb

# Clean up the .deb file
rm docker-desktop-amd64.deb

echo "Docker and Docker Desktop installation completed successfully."
