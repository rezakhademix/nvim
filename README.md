## 💤 NeoVim

A complete editor based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Installlation

I assumed you already have nvim installed on your machine! So just run:

```
mv ~/.config/nvim{,.bak}

git clone https://github.com/rezakhademix/nvim ~/.config/nvim
```

## Supported Languages (LSP & DAP & Linter & Formatter)
* Golang
* PHP

* Makefile
* Markdown
* JSON
* Spell-Check
* TypeScript
* Docker
* Docker-Compose
* JavaScript
* HTML
* CSS
* eslint
* Bash
* Golang-Linter
* PHP-CS-Fixer
* YML
* Lua

## Customization
* I have some modification in lazyvim default configurations and now it has a better cmp, document/signature highlight and better sytanx, auto-complete and no ghost-text.
* I changed the default behavior of noice cause it has so much bugs on lazyvim.
* I added database support with dbee/nvim and now you can press leader+db to query database and see tables and structures easily.
* I added lspsignature to make a better and more useful method arguments info while typing.
* I added multiple cursor support with nvim-multiple-cursor so you can use <C-j> or <C-k> or <C-leftclick> to add multiple cursor at once.
* Another change was telescope. I hide the search preview cause it makes telescope faster and nicer and now it is a dropdown menu like other parts of lazyvim for more consitent looking.
* I added nord theme but you can delete the file under plugins folder and add your favourite color-scheme.
