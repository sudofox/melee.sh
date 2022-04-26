# sudofox/melee.sh

Make the Smash Bros Melee narrator announce whether your command is successful or not.

## Requirements

In order to play sound, you will need _at least_ one of the following utilities: 

- `ffplay` (Usually provided with [ffmpeg](https://ffmpeg.org/download.html))
- `pw-play` ([Fedora](https://packages.fedoraproject.org/pkgs/pipewire/pipewire-utils/), [Ubuntu (since 21.04)](https://packages.ubuntu.com/jammy/pipewire-bin))
- `paplay` ([Fedora](https://packages.fedoraproject.org/pkgs/pulseaudio/pulseaudio-utils/), [Ubuntu](https://packages.ubuntu.com/jammy/pulseaudio-utils))
- or, `aplay` ([Fedora](), [Ubuntu](https://packages.ubuntu.com/jammy/alsa-utils)).

Melee.sh will attempt to use the first one it finds. If an audio utility is not found, the command being passed will still try to run without sound.

## Installation 

Download the melee.sh repository to your directory of choice, for example, `~/.local/bin/`, and then add the following line to your `.bashrc`:

```bash
. ~/.local/bin/melee.sh/melee.sh
```

## Usage

When you want to run a command, prefix it with `melee` for sounds to be played.

```bash
$ melee %command%
```

### Examples
```bash
# FAILURE!
$ melee stat /tmp/a
stat: cannot statx '/tmp/a': No such file or directory

# SUCCESS!
$ melee stat /tmp/b
  File: /tmp/b
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: 0,32    Inode: 404         Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/   aburk)   Gid: ( 1000/   aburk)
Access: 2022-04-22 13:30:56.057428192 -0400
Modify: 2022-04-22 13:30:56.057428192 -0400
Change: 2022-04-22 13:30:56.057428192 -0400
 Birth: -
```
