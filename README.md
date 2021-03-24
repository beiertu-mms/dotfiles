# Dotfiles
[![linter](https://github.com/beiertu-mms/dotfiles/actions/workflows/linter.yaml/badge.svg?branch=master)](https://github.com/beiertu-mms/dotfiles/actions/workflows/linter.yaml)

My dotfiles setup using git bare repository functionality.

## How to track the dotfiles with a bare repository
- Create a placeholder
  ```bash
  mkdir $HOME/dotfiles
  ```

- Initialize bare repository
  ```bash
  git init --bare $HOME/dotfiles
  ```

- Create alias to interact with the dotfiles
  ```bash
  alias dot='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
  ```
  so instead of `git add` or `git status`, use `dot add`, `dot status` etc.

- Setup status to not show untracked files
  ```bash
  dot config --local status.showUntrackedFiles no
  ```

- Add remote
  ```bash
  dot remote add origin <remote-git-repository>
  ```

- Show currently tracked files
  ```bash
  dot ls-tree -r master --name-only
  ```

## Setting up a new machine
- Clone to a temporary folder<br>
  ```bash
  git clone --separate-git-dir=$HOME/dotfiles <remote-git-url> tmp-dotfiles
  ```

- Synchronize files<br>
  ```bash
  rsync --recursive --verbose --exclude '.git' tmp-dotfiles/ $HOME/
  ```

- Remove the temporary folder<br>
  ```bash
  rm -rf tmp-dotfiles
  ```
