# Neovim Config

> Personal cross-platform Neovim configuration

---

## 🔌 Plugins

Installed with [`lazy.nvim`](https://github.com/folke/lazy.nvim):

- [alpha-nvim](https://github.com/goolord/alpha-nvim) – Dashboard and startup screen  
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) – Auto-closing of brackets, parens, etc.  
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) – Autocompletion engine  
  - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) – Buffer completions  
  - [cmp-path](https://github.com/hrsh7th/cmp-path) – Filesystem path completions  
  - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) – LSP source for `nvim-cmp`  
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) – VSCode-like icons in autocompletion  
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) – Easy LSP server config  
- [mason.nvim](https://github.com/williamboman/mason.nvim) – Manage external LSPs/DAPs/linters  
  - [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)  
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) – Statusline  
- [rose-pine](https://github.com/rose-pine/neovim) – Color theme  
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) – Filetype icons  
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) – Lua helper library  
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) – Fuzzy finder  
- [oil.nvim](https://github.com/stevearc/oil.nvim) – File explorer in buffer  
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) – Indent guides  

---

## 🌐 Supported Languages

- **Java** – LSP (`jdtls`) ready

---

## ⚙️ Setup
### Windows
git clone https://github.com/sjd23dev/nvim-config %LOCALAPPDATA%\nvim
### Linux / macOS
git clone https://github.com/sjd23dev/nvim-config ~/.config/nvim

---

## 🧠 Notes

- Automatically sets working directory:
  - **Windows:** 'C:/Projects' (fallsback to 'C:/' if missing)
  - **Unix:** '~'
