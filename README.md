# vim-pastplace

A plugin to restore the last cursor position.
Forked from [vim-lastplace](https://github.com/dietsche/vim-lastplace).


## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug),

```vim
Plug 'raviqqe/vim-pastplace'
```


## Configuration

You can configure what file types to ignore by setting
`g:pastplace_ignore` in your vimrc. By default it is set to:

```vim
let g:pastplace_ignore = ['gitcommit', 'gitrebase', 'svn', 'hgcommit']
```


## License

[MIT](./LICENSE)
