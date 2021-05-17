FROM archlinux

RUN pacman -Sy --noconfirm \
    && pacman -S --noconfirm archlinux-keyring \
    && pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        xorg \
        xorg-xinit \
        neovim \
        termite \
        alacritty \
        ttf-hack \
        adobe-source-code-pro-fonts \
        git \
        xmonad \
        xmonad-contrib \
        zsh \
        feh

RUN useradd --create-home --shell /usr/bin/zsh piknik \
    && mkdir -p ~/dotfiles

USER piknik
WORKDIR /home/piknik
