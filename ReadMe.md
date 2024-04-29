# Super Basic Nvim Configuration for GoLang
## Installation 
1. Install NVIM
2. Install Plug plugin manager
   - Linux: `curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
   - Windows: `iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force`
 
4. Clone the repo on your ~/.config/
5. Run `nvim` and exetute :PlugInstall
6. Uncomment the line: 40, and save
7. Ready to use


## KeyMaps 
- Ctrl + /     => Toggle Comment Line       (for N, I modes)
- Ctrl + s     => Save file                 (for N, I modes) 
- Ctrl + x     => Cut line                  (for N, I modes)
- Ctrl + u     => Word to Upper case        (for N mode)
- Ctrl + l     => Word to Lower case        (for N mode)
- Ctrl + d     => Multicursor current word  (for N, I, X modes)
- Ctrl + Up    => Multicursor Up            (for N mode)
- Ctrl + Down  => Multicursor Down          (for N mode)
- Ctrl + t     => Toggle Terminal 1         (for N, I modes)       
- Alt + 1      => Toggle Terminal 1         (for N, I modes) 
- Alt + 2      => Toggle Terminal 2         (for N, I modes)
- Alt + 3      => Toggle Terminal 3         (for N, I modes)
- Alt + 4      => Toggle Terminal 4         (for N, I modes)
- Alt + Up     => Moves the line Up         (for N mode)
- Alt + Down   => Moves the line Down       (for N mode)
