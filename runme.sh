#!/bin/zsh
sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

sudo pacman -S yay base-devel patch tk barrier 
yay -S git-credential-manager git-credential-manager-extras google-chrome chromedriver teamviewer anydesk-bin fwupd geckodriver python-pipx



sudo systemctl enable teamviewerd.service  --now
sudo systemctl enable anydesk --now 

git-credential-manager configure

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sed -i "/zstyle ':omz:update' mode auto/s/^#//g" ~/.zshrc
sed -i "/zstyle ':omz:update' frequency 13/s/^#//g" ~/.zshrc
BARRIER_SSL_PATH=~/.local/share/barrier/SSL/

mkdir -p "${BARRIER_SSL_PATH}"
openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout ${BARRIER_SSL_PATH}/Barrier.pem -out ${BARRIER_SSL_PATH}/Barrier.pem

cat > "${HOME}/.config/autostart/barrier.desktop" <<- "EOF"
[Desktop Entry]
Categories=Utility;RemoteAccess;
Comment=Keyboard and mouse sharing solution
Exec=barrier
Icon=barrier
Keywords=keyboard;mouse;sharing;network;share;
Name=Barrier
Terminal=false
Type=Application
EOF


git config --global credential.helper store
git config --global credential.helper /usr/bin/git-credential-manager-core
git config --global credential.credentialStore secretservice


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
zsh
omz theme set powerlevel10k/powerlevel10k

git clone https://github.com/DTS-And-Eaglepoint-Funding/omzplug.git ~/.oh-my-zsh/custom/plugins/omzplug
git clone https://github.com/Deep-Tech-Showcase-Eaglepoint-Funding/anyenv-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/anyenv-full-autoupdate
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
git clone https://github.com/Deep-Tech-Showcase-Eaglepoint-Funding/pyenv-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pyenv-full-autoupdate
git clone https://github.com/davidparsson/zsh-pyenv-lazy.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/pyenv-lazy
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone https://github.com/3v1n0/zsh-bash-completions-fallback.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bash-completions-fallback
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/qoomon/zsh-lazyload.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-lazyload
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search


omz plugin enable git git-auto-fetch zsh-autosuggestions python sudo aliases zsh-syntax-highlighting archlinux pip pyenv ohmyzsh-full-autoupdate zsh-lazyload systemd zsh-interactive-cd anyenv-full-autoupdate omzplug zsh-completions zsh-bash-completions-fallback


git clone https://github.com/anyenv/anyenv ~/.anyenv
git clone https://github.com/anyenv/anyenv-install ~/.config/anyenv/anyenv-install
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(anyenv init -)"' >> ~/.zshrc
echo 'alias py="python"' >> ~/.zshrc
echo 'alias del="rm"' >> ~/.zshrc
echo 'alias pe="vrun"' >> ~/.zshrc
echo 'alias mvnev="mkv"' >> ~/.zshrc
eval "$(anyenv init -)"
mkdir -p ~/.anyenv/plugins

anyenv install --init -y

git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
git clone https://github.com/a5ob7r/anyenv-fast-init.git ~/.anyenv/plugins/anyenv-fast-init
git clone https://github.com/amashigeseiji/anyenv-lazyload.git ~/.anyenv/plugins/anyenv-lazyload
git clone https://github.com/momo-lab/anyenv-plugin.git ~/.anyenv/plugins/anyenv-plugin
git clone https://github.com/aereal/anyenv-exec.git ~/.anyenv/plugins/anyenv-exec
git clone https://github.com/link-u/anyenv-cached-init.git ~/.anyenv/plugins/anyenv-cached-init
git clone https://github.com/dochang/anyenv-target.git ~/.anyenv/plugins/anyenv-target
git clone https://github.com/Milly/anyenv-each ~/.anyenv/plugins/anyenv-each
git clone https://github.com/abicky/anyenv-disable.git ~/.anyenv/plugins/anyenv-disable
git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git

anyenv install pyenv


git clone https://github.com/pyenv/pyenv-doctor.git ~/.anyenv/envs/pyenv/plugins/pyenv-doctor
git clone https://github.com/pyenv/pyenv-update.git ~/.anyenv/envs/pyenv/plugins/pyenv-update
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenvwrapper
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv
git clone https://github.com/real-yfprojects/pyenv-link.git ~/.anyenv/envs/pyenv/plugins/pyenv-link






pipx install pyqt5 cutelog
