# Dotfiles #

Common dotfiles to help you clean up your linux installation and get
it working the way you like

Useful **Dotfiles** for linux boxes.
- .bashrc
- .profile
- .Xresources
- .dircolors

Also those config files in
- ~/.config/

Some scripts which are kept in 
- ~/bin/

## Usage ##

- Clone the repo somewhare
- cd into the cloned repository
- Use gnu stow to make a link back to where the configuration file
  should go. We wont need to state -t ~ if you leave the repo in the
  homefolder.

``` bash
$ stow -t ~ xinitrc
```

There is a bash script with a list of the files to stow in
stowit.sh. You probably don't need all of these.
``` bash
$ sh ./stowit.sh
```

You may get errors when a file already exists as **stow** will refuse
to overwrite it for safety. You can force stow to overwrite the file
or you can remove the old file. 

If things aren't working ...
- Check you have installed the correct packages
- Check you have configured the correct services

## Inspirations from ##

- [ArchWiki on i3](https://wiki.archlinux.org/title/I3 "i3")
- rxrob (bashrc)
- Typecraft (i3, stow)
- Sol does tech (Hyprland)
- My linux for work (Hyprland)
- [ermanno EL linux made simple](https://www.youtube.com/watch?v=lvLExb1SUzM "Ermanno")
- Polybar web site for information on font problems, using fc-list,
  fc-match
- [Andreatta i3 config](https://github.com/andreatta/config/tree/master/i3 "Andreatta")


## Emacs configuration ##

- [System Crafters Youtube channel](https://www.youtube.com/@SystemCrafters "Nice")
- [Protesilaos Stavrou](https://www.youtube.com/@protesilaos "Prot")

## Music player daemon ##

Put your music in ~/Music/

Stow the config file in ~/.config/mpd/mpd.conf
```bash
$ stow -t ~ mpd
```

Start with the sytecmctl --user option

```bash
$ systemctl --user start mpd
```
This will start mpd untill you stop the daemon or log out

If you want to have it working everytime you log on then
```bash
$ systemctl --user enable --now mpd
```
or 
```bash
$ systemctl --user enable mpd
$ systemctl --user start mpd
```

You can check the status of the daemon with
```bash
$ systemctl --user status mpd
```

First time start may take time due to building the database


