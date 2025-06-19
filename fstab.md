# Thu 19 Jun 16:07:14 IST 2025 #

# Using pacman with cache shared on NFS #

Check out;
[Stueja](https://gist.github.com/stueja/17ac61d542065549567ce6782bbdd525 "Gist on pacman-shared")

You need to have nfs-utils installed on both the server and the client

Check out the Arch Wiki on how to do this;
[NFS](https://wiki.archlinux.org/title/NFS "Arch Wiki on NFS")

Shell commands that need to be done as the super user are prefixed by `#` in
contrast to those which can be done by the normal user which are prefixed by
`$`.

## Using pacman cache on client ##

### Make sure the server is reachable ###

You have to be able to reach the nfs server so you can use either a hostname or
IP address. I prefer to use a hostname. This can be set up in your dns server or
you can put an entry in /etc/hosts

```sh
# Entry for NFS server called jackie.lan
192.168.178.6	jackie.lan
```

### Create a mountpoint on /mnt/pkgcache ###

```sh
# mkdir /mnt/pkgcache
```

### Enter line in /etc/fstab ###

Remember that those spaces in /etc/fstab are usually tabs.

```conf
jackie.lan:/srv/nfs/pacman/pkg	/mnt/pkgcache	nfs4	_netdev,noauto,x-systemd.anutmount,x-systemd.mount-timeout-10,timeo=14,x-systemd.idle-timeout=1min	0	0
```

### Reload systemd ###

```sh
# systemctl daemon-reload
```

### Edit /etc/pacman.conf ###

You need to edit this as the super user, using whatever editor you like.

```conf
# Add and uncomment
CacheDir=/mnt/pkgcache/
CacheDir=/var/cache/pacman/pkg/
```

### Mount the remote location  ###

(this should happen when the network is up)

```sh
# mount /mnt/pkgcache
```

Now you can check if something is there with ls and pacman away to your hearts content!
