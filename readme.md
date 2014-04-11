## Dotfiles

As you'd expect, plus a few extras.

### Installation

The install script will symlink files to your home directory, requesting permission for each file individually rather than dumping the lot. It'll also prompt before overwriting anything, with an option to backup any existing files.

Clone to somewhere sensible:

```
git clone https://github.com/garethfoote/dotfiles.git ~/.dotfiles
```

Likely make the install script executable

```
chmod +x install.sh
```

Install what you want:

```
./install.sh
```
