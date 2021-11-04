# Base16-nvim

> base16 neovim and shell colorscheme synchronization

## Features

- Base16 neovim schemes
- Base16 shell schemes
- Color synchronization script

## Installation

### Neovim

#### Pathogen

```
// Remember to run `:Helptags` to generate help tags
$ git clone https://github.com/base16-fork/base16-nvim $XDG_CONFiG_HOME/nvim/bundle/base16-nvim`
```

#### NeoBundle

```
NeoBundle 'base16-fork/base16-nvim'
```

#### Vundle

```
Plugin 'base16-fork/base16-nvim
```

#### Plug

```
Plug 'base16-fork/base16-nvim'
```

#### VAM

```
call vam#ActivateAddons([ 'vim-airline' ])
```

#### Dein

```
call dein#add('base16-fork/base16-nvim')
```

#### minpac

```
call minpac#add('base16-fork/base16-nvim')
```

#### Packadd

```
// Remember to run `:helptags ~/.vim/pack/dist/start/vim-airline/doc` to generate help tags
$ git clone https://github.com/base16-fork/base16-nvim $XDG_CONFiG_HOME/nvim/pack/dist/start/base16-nvim
```

#### Manual

copy all of the files into your `$XDG_CONFiG_HOME/nvim` directory

### Shell (Optional)

Create a symbolic link of the `color` script or copy the script into $PATH. For
example:

``` sh
// creating symbolic link
$ ln path/to/base16-nvim/color `directory in $PATH`

// copying file
$ cp path/to/base16-nvim/color `directory in $PATH`
```
