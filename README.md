# sudofox/melee.sh

Make the Smash Bros Melee narrator announce whether your command is successful or not.

## Installation

You will need ffplay installed on your system. This usually ships alongside ffmpeg.

Download melee.sh to your directory of choice, for example, `~/bin`, and then add the following to your `.bashrc`:

```bash
source ~/bin/melee.sh/melee.sh
```

Then when you want to run a command, prefix it with `melee`.

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