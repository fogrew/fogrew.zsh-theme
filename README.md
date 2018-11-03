## fogrew theme for Oh-My-Zsh

This is a theme for [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh).

### Features
* It displays current host.
* It displays current sub-directory, not the full path.
* It displays current node version if nvm is installed.
* It displays current git branch, and status.
* It displays time since last commit.
* It displays current time.

Git folder of good guy
![sreenshot](https://gurylev.com/i/5a7de928a4.jpg)

Git folder of bad buy
![sreenshot](https://gurylev.com/i/koco7z2x8d.jpg)

### Installation

To install this theme, clone this repository into your Oh-My-Zsh `custom/themes`
directory.

    $ cd ~/.oh-my-zsh/custom
    $ mkdir themes              # if it doesn't already exist
    $ cd themes
    $ git clone https://nights.site/Foggy/fogrew.zsh-theme.git

You then need to select this theme in your `~/.zshrc`:

    ZSH_THEME="fogrew.zsh-theme/fogrew"

### Bugs / Contact

If you have any requests or bug reports, please use the tracker in this Git
repository.