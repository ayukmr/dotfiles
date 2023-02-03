" ==================
" === Neovim LSP ===
" ==================

" ======================
" === Cmp Completion ===
" ======================

" highlight matching text
highlight CmpItemAbbrMatch      cterm=bold gui=bold
highlight CmpItemAbbrMatchFuzzy cterm=bold gui=bold

lua <<EOF
-- cmp module
local cmp = require 'cmp'

-- symbols for items
local symbols = {
  Text          = '',
  Method        = '',
  Function      = '',
  Constructor   = '',
  Field         = '',
  Variable      = '',
  Class         = '',
  Interface     = '',
  Module        = '',
  Property      = '',
  Unit          = '',
  Value         = '',
  Enum          = '',
  Keyword       = '',
  Snippet       = '',
  Color         = '',
  File          = '',
  Reference     = '',
  Folder        = '',
  EnumMember    = '',
  Constant      = '',
  Struct        = 'פּ',
  Event         = '',
  Operator      = '',
  TypeParameter = '',
}

-- setup cmp
cmp.setup({
  -- use ultisnips
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },

  -- formatting for items
  formatting = {
    format = function(_, item)
      -- show icons for kinds
      item.kind = symbols[item.kind]

      -- truncate string
      local old_abbr = item.abbr
      item.abbr = string.sub(item.abbr, 1, 25)

      -- add ellipses if truncated
      if item.abbr ~= old_abbr then
        item.abbr = item.abbr .. '…'
      end

      return item
    end,
  },

  -- window style
  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- completion keybinds
  mapping = cmp.mapping.preset.insert {
    ['<C-e>'] = cmp.mapping.abort(),

    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    ['<CR>']   = cmp.mapping.confirm { select = true },
    ['<M-CR>'] = cmp.mapping.complete(),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  },

  -- completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp'  },
    { name = 'ultisnips' },
    { name = 'buffer'    },
    { name = 'path'      },
  }),

  -- enable ghost text
  experimental = {
    ghost_text = true,
  },
})

-- search completion
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- command completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'cmdline' },
  },
})
EOF

" ================
" === Dressing ===
" ================

" title highlight
highlight! link FloatTitle Normal

lua <<EOF
-- dressing module
local dressing = require 'dressing'

-- setup dressing
dressing.setup({
  input = {
    win_options = {
      winblend = 0,
    }
  },
  select = {
    backend = 'builtin',
    builtin = {
      win_options = {
        winblend = 0,
      }
    },
  },
})
EOF

" ==============
" === Fidget ===
" ==============

" title highlight
highlight! link FidgetTitle Label

lua <<EOF
-- fidget module
local fidget = require 'fidget'

-- setup fidget
fidget.setup({
  text = {
    spinner = 'dots',
  },
  window = {
    blend = 25,
  },
  fmt = {
    stack_upwards = false,
  },
})
EOF

" =====================
" === LSP Installer ===
" =====================

lua <<EOF
-- lsp installer module
local lsp_installer = require 'nvim-lsp-installer'

-- setup lsp installer
lsp_installer.setup({
  automatic_installation = true,
  ui = {
    border = 'rounded',
    icons = {
      server_installed   = '',
      server_pending     = '',
      server_uninstalled = '',
    },
  },
})
EOF

" ==================
" === Neovim LSP ===
" ==================

" signs for diagnostics
sign define DiagnosticSignError text=>> texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn  text=-- texthl=DiagnosticSignWarn  linehl= numhl=
sign define DiagnosticSignInfo  text=-- texthl=DiagnosticSignInfo  linehl= numhl=
sign define DiagnosticSignHint  text=-- texthl=DiagnosticSignHint  linehl= numhl=

" lsp keybinds
nnoremap <silent> <Leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>lf :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <Leader>lr :lua vim.lsp.buf.rename()<CR>

nnoremap <silent> <M-d> :lua vim.diagnostic.open_float(nil, { scope = 'cursor', focus = false })<CR>
nnoremap <silent> [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d :lua vim.diagnostic.goto_next()<CR>

nnoremap <silent> K  :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>

" floating window background
highlight! link NormalFloat Normal

augroup lsp_info_background
  auto!
  " set background for lsp info
  auto FileType lspinfo set winhighlight=NormalFloat:PMenu
augroup END

lua <<EOF
-- lsp modules
local lspconfig    = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

-- window border
local border = {
  {'╭', 'FloatBorder'},
  {'─', 'FloatBorder'},
  {'╮', 'FloatBorder'},
  {'│', 'FloatBorder'},
  {'╯', 'FloatBorder'},
  {'─', 'FloatBorder'},
  {'╰', 'FloatBorder'},
  {'│', 'FloatBorder'},
}

local open_floating_preview = vim.lsp.util.open_floating_preview

-- open floating preview with custom border
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border

  return open_floating_preview(contents, syntax, opts, ...)
end

-- capabilities for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local servers = {
  'marksman',
  'pyright',
  'ruby_ls',
  'rust_analyzer',
  'sourcekit',
  'tsserver',
  'vimls',
}

-- add lsp servers
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

-- diagnostics config
vim.diagnostic.config({
  underline = true,
  signs     = true,

  virtual_text = false,
  float = {
    source = 'always',
  },
})
EOF

" ===============
" === Null LS ===
" ===============

lua <<EOF
-- null-ls module
local null_ls = require 'null-ls'

-- setup null-ls
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.rubocop,
  },
})
EOF

" =================
" === UltiSnips ===
" =================

" disable expand trigger
let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips-expand)'
