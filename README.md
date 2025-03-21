# dotfiles
Common dotfiles.

Useful **Dotfiles** for linux boxes.
.bashrc
.profile
.Xresources
.dircolors


Now in format for using gnu stow
$ stow -t ~ xinitrc

gitconfig
Using GCM


## Music player daemon ##

Put your music in ~/Music/

Stow the config file in ~/.config/mpd/mpd.conf
```bash
dotfilesRepo $ stow -t ~ mpd
```

Start with
```bash
$ systemctl --user start mpd
```

First time start may take time due to building the database
