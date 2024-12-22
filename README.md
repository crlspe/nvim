# Super Basic Nvim Configuration for GoLang
## Installation
1. Install NVIM
2. Install Plug plugin manager
```sh
https://github.com/junegunn/vim-plug
```
3. Clone the repo on your
```sh
  cd ~/.config/ && git clone https://github.com/crlspe/nvim.git`
```
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
4. Run
```sh
nvim
```
5. Execute the following VIM Command:
```
:PlugInstall
```
6. Open NeoVim configuration file
```
:e ~/.config/nvim/init.lua
```
or
```sh
nvim ~/.config/nvim/init.lua
```
7. Comment `--` the **Line: 36**
```lua
LINE 36: -- if true then return end
```
8. Save and Restart NeoVim

### KeyMaps

| Key Combination  | Action                           | Modes                |
|------------------|----------------------------------|----------------------|
| Ctrl + /         | Toggle Comment Line              | N, I                 |
| Ctrl + s         | Save file                        | N, I                 |
| Ctrl + x         | Cut line                         | N, I                 |
| Ctrl + u         | Word to Upper case               | N                    |
| Ctrl + l         | Word to Lower case               | N                    |
| Ctrl + d         | Multicursor current word         | N, I, X              |
| Ctrl + Up        | Multicursor Up                   | N                    |
| Ctrl + Down      | Multicursor Down                 | N                    |
| Ctrl + t         | Toggle Terminal 1                | N, I                 |
| Ctrl + p         | Fuzzy find files in folder       | N, I                 |
| Alt + p          | Find opened buffer files         | N, I                 |
| Alt + 1          | Toggle Terminal 1                | N, I                 |
| Alt + 2          | Toggle Terminal 2                | N, I                 |
| Alt + 3          | Toggle Terminal 3                | N, I                 |
| Alt + 4          | Toggle Terminal 4                | N, I                 |
| Alt + Up         | Moves the line Up                | N                    |
| Alt + Down       | Moves the line Down              | N                    |
| Ctrl + c         | Yanks line when no selection, yanks selection | N, I, V |
| Ctrl + z         | Undo last change (:undo)         | N, I                 |
| Ctrl + Shift + z | Redo last change (:redo)         | N, I                 |
## Themes Installed
- `vscode`    =>  Default
- `embark`
## Install LSP(s) with 
```
:Mason
```
#### Set theme (colorscheme) on line: `~144`
