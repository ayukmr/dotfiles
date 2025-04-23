" ==================
" === Neovim LSP ===
" ==================

" ========================
" === Blink Completion ===
" ========================

" max completion items
set pumheight=15

lua <<EOF
-- blink module
local blink_cmp = require "blink.cmp"

-- symbols for kinds
local symbols = {
  Text        = "󰦨",
  Method      = "󰅲",
  Function    = "󰅲",
  Constructor = "",

  Field    = "",
  Variable = "",
  Property = "",

  Class     = "",
  Interface = "󰠱",
  Struct    = "󰙅",
  Module    = "󰆧",

  Unit       = "",
  Value      = "",
  Enum       = "󰓻",
  EnumMember = "󰓻",

  Keyword  = "",
  Constant = "",

  Snippet   = "󰆐",
  Color     = "",
  File      = "󰈤",
  Reference = "",

  Folder        = "󰉋",
  Event         = "",
  Operator      = "󰍘",
  TypeParameter = "",
}

-- setup blink
blink_cmp.setup {
  appearance = {
    -- cmp highlights
    use_nvim_cmp_as_default = true,

    -- icons for kinds
    kind_icons = symbols,
  },

  cmdline = {
    completion = {
      menu = {
        -- show automatically
        auto_show = function(ctx)
          return vim.fn.getcmdtype() == ":"
        end
      },
    },
  },

  completion = {
    list = {
      selection = {
        -- require manual selection
        preselect = false,

        -- show inline completion
        auto_insert = true,
      },
    },

    documentation = {
      -- show automatically
      auto_show = true,
      auto_show_delay_ms = 0,
    },

    menu = {
      -- remove minimum width
      min_width = 1,

      draw = {
        -- items format
        columns = {
          { "label", "kind_icon", gap = 1 },
        },

        components = {
          label = {
            -- reduce max width
            width = { fill = true, max = 35 },
          },
        },
      },
    },
  },

  -- completion keybinds
  keymap = {
    ["<CR>"] = { "accept", "fallback" },

    ["<Tab>"]   = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },

    ["<C-j>"] = { "snippet_forward",  "fallback" },
    ["<C-k>"] = { "snippet_backward", "fallback" },
  },
}
EOF

" ================
" === Dressing ===
" ================

lua <<EOF
-- dressing module
local dressing = require "dressing"

-- setup dressing
dressing.setup {
  input = {
    -- horizontal padding
    border = { "", "", "", " " },
    win_options = {
      winblend = 0,
    },
  },

  select = {
    backend = "builtin",
    builtin = {
      -- horizontal padding
      border = { "", "", "", " " },

      -- show at cursor
      relative = "cursor",

      win_options = {
        winblend = 0,

        -- cursor line
        winhighlight = "CursorLine:DressingCursorLine",
      },
    },
  },
}
EOF

" ================
" === LSPFuzzy ===
" ================

" workspace diagnostics
nnoremap <silent> <leader>ld :LspDiagnosticsAll<CR>

lua <<EOF
-- lspfuzzy module
local lspfuzzy = require "lspfuzzy"

-- setup lspfuzzy
lspfuzzy.setup()
EOF

" =============
" === Mason ===
" =============

lua <<EOF
-- mason module
local mason = require "mason"

-- setup mason
mason.setup {
  ui = {
    icons = {
      package_installed   = "",
      package_pending     = "",
      package_uninstalled = "",
    },
  },
}

-- mason lspconfig module
local mason_lspconfig = require "mason-lspconfig"

-- setup mason lspconfig
mason_lspconfig.setup {
  -- automatic_installation = true,
}
EOF

" ==================
" === Neovim LSP ===
" ==================

" signs for diagnostics
sign define DiagnosticSignError text=>> texthl=DiagnosticSignError
sign define DiagnosticSignWarn  text=-- texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo  text=-- texthl=DiagnosticSignInfo
sign define DiagnosticSignHint  text=-- texthl=DiagnosticSignHint

" leader keybinds
nnoremap <silent> <Leader>lf :lua vim.lsp.buf.format()<CR>
nnoremap <silent> <Leader>lr :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>lR :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>lS :lua vim.lsp.buf.workspace_symbol("")<CR>

" buffer keybinds
nnoremap <silent> K  :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <C-w>v:lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gI :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gT :lua vim.lsp.buf.type_definition()<CR>

" diagnostic keybinds
nnoremap <silent> <M-d> :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d :lua vim.diagnostic.goto_next()<CR>

lua <<EOF
-- lsp modules
local lspconfig = require "lspconfig"
local blink_cmp = require "blink.cmp"

-- capabilities for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = blink_cmp.get_lsp_capabilities(capabilities)

local servers = {
  "clangd",
  "crystalline",
  "cssls",
  "dartls",
  "marksman",
  "pyright",
  "rubocop",
  "ruby_lsp",
  "rust_analyzer",
  "sourcekit",
  "ts_ls",
  "vimls",
}

-- add lsp servers
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- diagnostics config
vim.diagnostic.config {
  underline    = true,
  signs        = true,
  virtual_text = false,

  float = {
    scope  = "cursor",
    source = "always",
  },
}
EOF

" ===============
" === Null LS ===
" ===============

lua <<EOF
-- null-ls module
local null_ls = require "null-ls"

-- setup null-ls
null_ls.setup {
  sources = {
    require("none-ls.diagnostics.eslint"),
  },
}
EOF
