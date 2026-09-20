# Neovim Config

lightx0x · gruvbox-material dark · Sept 20, 2026

## Keybinds

`⎵` is the leader key (space). Leader and localleader are both space.

### LSP

Neovim 0.11+ ships its own `gr*` LSP mappings. Those are used directly rather
than duplicated under the leader key, except where a nicer UI is worth it —
`grr` is overridden to use Telescope.

| Key | Action |
|-----|--------|
| `gd` | Go to definition (cross-file) |
| `gD` | Go to declaration |
| `grr` | Find all references (Telescope, includes current line) |
| `gra` | Code action |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grn` | Rename symbol |
| `gO` | Document symbols |
| `K` | Hover docs (built-in, attached automatically) |
| `⎵ rn` | Rename symbol |
| `⎵ ca` | Code action |
| `D` | Diagnostics float |

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
| `Ctrl e` | Quick menu |
| `⎵ fl` | Open in Telescope |
| `Ctrl p` | Previous file |
| `Ctrl n` | Next file |

To remove a file from the list, open the quick menu with `Ctrl e`, delete the
line with `dd`, and write with `:w`.

### Folding

| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zm` | Close all folds one level |
| `zM` | Close all folds |
| `zr` | Open all folds one level |
| `zR` | Open all folds |
| `zo` | Open fold under cursor |
| `zc` | Close fold under cursor |

### Todo Comments

| Key | Action |
|-----|--------|
| `]t` | Next todo comment |
| `[t` | Previous todo comment |

### Yazi

| Key | Action |
|-----|--------|
| `⎵ yz` | Open yazi at current file |
| `⎵ yw` | Open yazi in working directory |

### Search & Replace

| Key | Action |
|-----|--------|
| `⎵ sr` | Open search and replace |
| `⎵ sw` | Search and replace current word |

Inside the grug-far results buffer, to replace individual matches rather than
all of them at once:

| Key | Action |
|-----|--------|
| `⎵ r` | Replace all matches |
| `⎵ j` | Apply the match under the cursor, then move to the next |
| `⎵ k` | Apply the match under the cursor, then move to the previous |
| `⎵ l` | Sync the current line (after editing it by hand) |
| `⎵ s` | Sync all lines — `dd` the ones to skip first |
| `g?` | Show every available action |

### Editing

| Key | Action |
|-----|--------|
| `p` (visual) | Paste without overwriting register |
| `Enter` | New line below cursor |
| `Alt Enter` | New line above cursor |
| `Ctrl h` | Select entire buffer |

### Terminal & Misc

| Key | Action |
|-----|--------|
| `⎵ ft` | Toggle floating terminal |
| `Ctrl x` (term) | Close floating terminal |
| `⎵ lg` | Open lazygit |
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

These are Treesitter capture groups, so they only apply where a parser is
installed and highlighting has been started — see below.

## Treesitter

On the `main` branch, parsers are installed explicitly and highlighting is
started by a `FileType` autocmd; neither happens on its own.

Currently covered: `lua`, `rust`, `typescript`, `typescriptreact`,
`javascript`, `javascriptreact`.

To add a language, install the parser and add the filetype to the autocmd
pattern in `lua/plugins/treesitter.lua`:

```bash
nvim --headless -c 'lua require("nvim-treesitter").install({ "python" }):wait(540000)' -c 'qa!'
```

`install()` is async, so the `:wait()` matters — without it the editor quits
before the download finishes. To refresh parsers after a plugin update, use
`update()` in place of `install()`.

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
| gitsigns | Git change markers in gutter |
| todo-comments | Highlight TODO/FIXME/HACK comments |
| yazi | Terminal file manager |
| grug-far | Repo-wide search and replace |

## Automatic Behaviors

| Feature | Description |
|---------|-------------|
| Format on save | LSP-based, all attached clients |
| Treesitter highlighting | Started per filetype; falls back to regex syntax elsewhere |
| Yank highlight | Brief flash on copied text |
| No auto-comment | New lines don't continue comment leaders |
| TS/TSX/CSS indent | 2-space tabs for web files |
| Treesitter folding | Expression-based folds, open by default |
| Transparent background | Normal and NormalFloat cleared |
| Dynamic Node path | Auto-detects latest nvm version |
| Git signs in gutter | +/~/_ markers for added, changed, deleted lines |

## Commit Convention

This repo uses [Conventional Commits](https://www.conventionalcommits.org):

```
<type>(<optional scope>): <description>
```

| Type | Use for |
|------|---------|
| `feat` | A new capability |
| `fix` | A bug fix |
| `docs` | Documentation only |
| `refactor` | Restructuring with no behavior change |
| `chore` | Maintenance, lockfile bumps |

Scopes match the config layout — `lsp`, `keybinds`, `colors`, `treesitter`,
`options`, `flterm`, `none-ls`.
