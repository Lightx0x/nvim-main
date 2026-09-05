# Neovim Config

lightx0x · gruvbox-material dark · Sept 5, 2026

## Keybinds

### LSP *(new)*

| Key | Action |
|-----|--------|
| `gd` | Go to definition (cross-file) |
| `gD` | Go to declaration |
| `gr` | Find all references (Telescope, includes current line) |
| `K` | Hover docs |
| `⎵ rn` | Rename symbol |
| `⎵ ca` | Code action |

### Navigation

| Key | Action |
|-----|--------|
| `⎵ cd` | Open netrw file explorer |
| `⎵ ff` | Find files (incl hidden) |
| `⎵ fg` | Live grep |
| `⎵ fb` | Open buffers |
| `⎵ fh` | Help tags |

### Harpoon

| Key | Action |
|-----|--------|
| `⎵ a` | Add file to list |
| `⎵ r` | Remove file from list |
| `Ctrl e` | Quick menu |
| `⎵ fl` | Open in Telescope |
| `Ctrl p` | Previous file |
| `Ctrl n` | Next file |

### Editing

| Key | Action |
|-----|--------|
| `p` (visual) | Paste without overwriting register |
| `Enter` | New line below cursor |
| `Alt Enter` | New line above cursor |
| `Ctrl h` | Select entire buffer |
| `D` | Diagnostics float |

### Terminal & Misc

| Key | Action |
|-----|--------|
| `⎵ ft` | Toggle floating terminal |
| `Ctrl x` (term) | Close floating terminal |
| `⎵ x` | Make file executable |
| `⎵ ux` | Remove executable flag |
| `jj` / `jk` (insert) | Exit insert mode |

## Theme & Syntax Colors

gruvbox-material dark hard with custom highlight overrides

| Color | Hex | Role |
|-------|-----|------|
| yellow | `#d8a657` | keywords, types, control flow, operators |
| green | `#a9b665` | strings |
| slate | `#a0a0a0` | functions, methods, module paths |
| red | `#ea6962` | errors, diagnostics |
| fg | `#d4be98` | variables, fields, constants, punctuation |
| grey | `#928374` | comments (italic) |

## Plugins

| Plugin | Purpose |
|--------|---------|
| gruvbox-material | Color scheme |
| lualine | Status line |
| telescope | Fuzzy finder |
| harpoon | File bookmarks |
| treesitter | Syntax highlighting |
| nvim-lspconfig | LSP configuration |
| mason | LSP/formatter installer |
| none-ls | Formatter orchestration |
| nvim-cmp | Autocompletion |
| nvim-autopairs | Auto close brackets |
| alpha-nvim | Dashboard |
| lazygit | Git UI |
| gitsigns *(new)* | Git change markers in gutter |
| todo-comments *(new)* | Highlight TODO/FIXME/HACK comments |

## Automatic Behaviors

| Feature | Description |
|---------|-------------|
| Format on save | LSP-based, all attached clients |
| Yank highlight | Brief flash on copied text |
| No auto-comment | New lines don't continue comment leaders |
| TS/TSX/CSS indent | 2-space tabs for web files |
| Treesitter folding *(new)* | Expression-based folds, open by default |
| Transparent background | Normal and NormalFloat cleared |
| Dynamic Node path | Auto-detects latest nvm version |
| Git signs in gutter *(new)* | +/~/_ markers for added, changed, deleted lines |
