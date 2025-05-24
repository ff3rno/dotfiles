# Dotfiles

Personal configuration files for:
- Vim (.vimrc)
- Tmux (.tmux.conf)
- Git (gitconfig)
- **Fish shell (.config/fish)**:
    - *Aliases*: Custom shortcuts for common commands (e.g., `ls`, `git`, package managers like `pnpm`, `npm`, `yarn`). Located in `.config/fish/conf.d/aliases.fish`.
    - *Greeting*: The welcome message is disabled. Configuration in `.config/fish/conf.d/greeting.fish`.
    - *Paths*: Includes paths for Homebrew, LM Studio, and NVM. Defined in `.config/fish/conf.d/paths.fish`.
    - *Virtualenv*: Automatically sources a virtualenv located at `$HOME/.venv/bin/activate.fish`. Configuration in `.config/fish/conf.d/virtualenv.fish`.
    - *Custom Functions*:
        - `gc user/repo`: Clones a GitHub repository to `~/.src/github/user/repo` and changes the current directory to it.
        - `gf branch`: Fetches a specific branch from the remote repository.
        - `gp`: Pushes the current branch to its remote.
        - `gpf`: Force pushes the current branch to its remote.
        - `gss`: Shows a detailed and colorized git status.
        These functions are located in the `.config/fish/functions/` directory.
- **Neovim (.config/nvim)**:
    - Highly customized configuration located in `init.vim`.
    - *Plugin Management*: Uses `vim-plug` for managing a large list of plugins. The plugin directory is `~/.nvim-plugins` (or `~/.vim-plugins` for Vim).
    - *Key Features & Plugins*:
        - **LSP**: Extensive Language Server Protocol integration using `nvim-lspconfig`, `mason.nvim` for LSP server management, and various LSP-related UI enhancements like `lsp-status`, `nvim-lightbulb`, and `glance.nvim`.
        - **Completion**: Advanced autocompletion setup with `nvim-cmp` and multiple sources (LSP, buffer, path, snippets, emoji, etc.).
        - **Snippets**: Utilizes `UltiSnips` and `vim-snippets` for code snippets.
        - **Telescope**: Heavily configured for fuzzy finding files, buffers, help tags, workspaces, diagnostics, and more. Includes `telescope-fzf-native` for performance.
        - **Treesitter**: Integrated for syntax highlighting, indentation, autotags, rainbow delimiters, and text objects.
        - **File Explorer**: `nvim-tree.lua` provides a feature-rich file explorer.
        - **UI Enhancements**: Includes `lualine.nvim` for a custom statusline, `nvim-web-devicons`, various themes (e.g., `tokyonight`, `catppuccin`, `kanagawa`), `nvim-notify` for notifications, `true-zen.nvim` for distraction-free modes, and `smart-splits.nvim`.
        - **Git Integration**: `vim-fugitive`, `gitsigns.nvim`, `diffview.nvim`.
        - **Markdown Support**: Enhanced Markdown editing with `mkdx`, `vim-markdown`, and `markdown-preview.nvim`.
        - **AI Integration**: Includes plugins like `vim-ai`, `codeium.vim`, and `backseat.nvim`.
        - **Many other utility plugins**: For improved editing, navigation (e.g., `hop.nvim`, `leap.nvim`), commenting (`Comment.nvim`), testing (`vim-test`, `jester`), and more.
    - *Keybindings*: Numerous custom keybindings for plugin functionalities, window management, LSP actions, and editing enhancements. The leader key is `,`.
    - *Appearance*: Configured with `JetBrainsMono Nerd Font`, multiple light and dark colorschemes with `vim-thematic` for easy switching.
    - *Specific Configurations*: Includes settings for Python 3 host, various filetype-specific settings, and GUI options for Neovim-GTK.

## Installation

These dotfiles are managed using `dotfiles-rust`, a utility for managing dotfiles.

1.  **Install `dotfiles-rust`**:
    If you don't have it already, install `dotfiles-rust` using Cargo:
    ```bash
    cargo install dotfiles-rust
    ```

2.  **Clone this repository**:
    ```bash
    git clone https://github.com/ff3rno/dotfiles.git
    ```

3.  **Initialize `dotfiles-rust`**:
    Navigate to the cloned directory and initialize `dotfiles-rust` (replace `/path/to/cloned/dotfiles` with the actual path to where you cloned the repository, e.g., `~/dotfiles` or `~/.dotfiles`):
    ```bash
    cd dotfiles # Or the directory where you cloned it
    dotfiles-rust init $(pwd)
    ```
    This will create a configuration file at `~/.dotfiles-rustrc.yaml`.

4.  **Install the dotfiles**:
    Use `dotfiles-rust` to install the configurations. It's recommended to back up any existing files.
    ```bash
    dotfiles-rust install --backup --verbose
    ```
    This command will symlink the files from this repository to your home directory.

## License

MIT

## Custom Fonts

This setup uses several custom fonts, primarily from the [Nerd Fonts](https://www.nerdfonts.com/) collection, which are patched developer targeted fonts with a high number of glyphs (icons).

The specific font families included in the `.local/share/fonts/` directory are:
-   **Cabin**: A humanist sans serif typeface. Includes various weights and styles (Regular, Medium, Bold, Italic, Condensed, SemiCondensed).
-   **JetBrains Mono**: A monospaced font specifically designed for developers. Includes Regular, Medium, Bold, and Italic versions, also patched as Nerd Fonts.

### Font Installation

The fonts are located in the `.local/share/fonts/` directory of this repository. To use them, you need to install them on your system.

**Linux:**

1.  Create the directory `~/.local/share/fonts` if it doesn't already exist:
    ```bash
    mkdir -p ~/.local/share/fonts
    ```
2.  Copy the font files from this repository's `.local/share/fonts/` directory to `~/.local/share/fonts/`.
    Assuming you have cloned the repository to `~/dotfiles`:
    ```bash
    cp ~/dotfiles/.local/share/fonts/* ~/.local/share/fonts/
    ```
3.  Rebuild the font cache:
    ```bash
    fc-cache -f -v
    ```

**macOS:**

1.  Copy the font files from this repository's `.local/share/fonts/` directory to `~/Library/Fonts/`.
    Assuming you have cloned the repository to `~/dotfiles`:
    ```bash
    cp ~/dotfiles/.local/share/fonts/* ~/Library/Fonts/
    ```
    Alternatively, you can install them in `/Library/Fonts/` to make them available to all users.
2.  macOS should pick up the new fonts automatically. If not, you might need to restart applications or, in rare cases, your system. You can also open Font Book (usually found in Applications), which will validate and install fonts dropped into its window or copied to the `~/Library/Fonts` directory.
