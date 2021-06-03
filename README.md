# VimRc Config
My vimrc setting file as of 3 June 2021

### Updated on 12 Feb 2021:
Vim fugitive
Relative lines

### Updated on 12 Jan 2021:
Now also includes the hyper config, figured I wouldn't be using one without the other.
Also the new font is just amazing with gruvebox theme for vimrc :)


## Installation:
  * Install [vim-plug](https://github.com/junegunn/vim-plug)
  * Open ~/.vimrc file. Set paste mode :set paste
  * Copy / paste the config below to ~/.vimrc
  * Reload your new configs by running :source ~/.vimrc
  * Run `:PlugInstall`
  * Run `:CocInstall coc-tsserver coc-json coc-html coc-css`
  * Run `:CocInstall coc-eslint coc-prettier`
  * Copy the config below to `~/.vim/coc-settings.json`
  * Type `:so %`
  * Enjoy :)

### COC Settings
  * Copy in File `~/.vim/coc-settings.json`
  ```
  {
  "coc.preferences.formatOnSaveFiletypes": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],
  "tsserver.formatOnType": true,
  "coc.preferences.formatOnType": true,
  "javascript.validate.enable": false
}
```
