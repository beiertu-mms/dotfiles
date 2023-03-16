# <p align="center"><img src="https://github.com/jglovier/dotfiles-logo/blob/main/dotfiles-logo.png" alt="dotfiles logo" width="400"></p>

<div style="text-align: center;">

  <a href="https://github.com/beiertu-mms/dotfiles/blob/master/.github/LICENSE.txt">![GitHub](https://img.shields.io/github/license/beiertu-mms/dotfiles?style=flat-square)</a>
  <a href="https://github.com/beiertu-mms/dotfiles/actions/workflows/linter.yaml">![GitHub](https://img.shields.io/github/actions/workflow/status/beiertu-mms/dotfiles/linter.yaml?style=flat-square)</a>

</div>

My dotfiles setup using [git](https://git-scm.com/) bare repository functionality.

- Table of contents
  - [Prerequisites](#prerequisites)
  - [Set up from scratch](#set-up-from-scratch)
  - [Install the dotfiles on a new machine](#install-the-dotfiles-on-a-new-machine)
  - [Credits](#credits)
  - [License](#license)

## Prerequisites

- git
- rsync (to set up a new machine)

## Set up from scratch

1. Create a placeholder for git internal files  

```sh
mkdir -p ~/dotfiles
```

2. Initialize the bare repository  

```sh
git init --bare ~/dotfiles
```

3. Create an alias to interact with the dotfiles  

```sh
alias dot='git --git-dir=~/dotfiles/ --work-tree=$HOME'
```

So now instead of `git add` or `git status`, use `dot add`, `dot status` etc.

4. Configure git to ignore all files by default  

```sh
dot config --local status.showUntrackedFiles no
```

5. Now you are ready to track your dot files.  

**Note:** To see which files are currently being tracked, use 

```sh
dot ls-tree -r master --name-only
```

## Install the dotfiles on a new machine

1. Clone to a temporary folder  

```sh
git clone --separate-git-dir=~/dotfiles <remote-git-url> tmp-dotfiles
```

2. Synchronize the files  

```sh
rsync --recursive --verbose --exclude '.git' tmp-dotfiles/ ~/
```

3. Remove the temporary folder  

```sh
rm -rf tmp-dotfiles
```

## Credits

- [dotfiles image](https://github.com/jglovier/dotfiles-logo/blob/main/dotfiles-logo.png) by [Joel Glovier](https://github.com/jglovier)

## License

Distributed under the MIT License. See [LICENSE.txt](./LICENSE.txt) for more information.
