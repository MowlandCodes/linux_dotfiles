# 💻 My Linux Dotfiles 💻
This repo is dedicated for my dotfiles collection, you can use it if you want by simply following these steps below. 

## 📜 Requirements 📜
Before using my dotfiles, you must install some programs with this command:
<br></b>
> Use your own Package Manager, I use Ubuntu 24.04 Package Manager, so I use `apt` command:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git stow golang rustup nodejs npm python3-pip neovim zsh curl rofi -y

# Starship Installation
curl -sS https://starship.rs/install.sh | sh
```
<br></b>
> If you want to use Wezterm Terminal Emulator, run this command:
```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Then update using sudo apt update
sudo apt update
sudo apt install wezterm -y
```

## 📥 Installation 📥
Use these commands to install my dotfiles:
```bash
stow nvim && stow zsh && stow starship && stow wezterm && stow rofi
```
And you're good to go!<br>

### 🌟 Thank you for using my dotfiles, you can use them as you want, just don't forget to give me a star if you like it! 🌟
