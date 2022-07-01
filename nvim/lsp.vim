" ==================
" === Neovim LSP ===
" ==================

" signs for diagnostics
sign define DiagnosticSignError text=>> texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn  text=-- texthl=DiagnosticSignWarn  linehl= numhl=
sign define DiagnosticSignInfo  text=-- texthl=DiagnosticSignInfo  linehl= numhl=
sign define DiagnosticSignHint  text=-- texthl=DiagnosticSignHint  linehl= numhl=

" floating diagnostics
nnoremap <silent> <M-h> :lua vim.diagnostic.open_float()<CR>

" ===============
" === Trouble ===
" ===============

" highlights for trouble
highlight TroubleText ctermfg=fg ctermbg=none guifg=fg guibg=none

" keybinds for trouble
nnoremap <Leader><C-t> :TroubleToggle<CR>

" =================
" === Lua Setup ===
" =================

lua <<EOF
    -- plugins
    local cmp      = require 'cmp'
    local nvim_lsp = require 'lspconfig'
    local lspkind  = require 'lspkind'
    local trouble  = require 'trouble'

    -- ======================
    -- === Cmp Completion ===
    -- ======================

    -- completion
    cmp.setup {
      -- use ultisnips
      snippet = {
        expand = function(args)
          vim.fn['UltiSnips#Anon'](args.body)
        end,
      },

      -- use lspkind symbols
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          symbol_map = {
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
          },
        },
      },

      -- keybinds for completion
      mapping = cmp.mapping.preset.insert {
        ['<C-u>']   = cmp.mapping.scroll_docs(-8),
        ['<C-d>']   = cmp.mapping.scroll_docs(8),
        ['<Tab>']   = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-e>']   = cmp.mapping.abort(),
        ['<CR>']    = cmp.mapping.confirm { select = true },
        ['<M-CR>']  = cmp.mapping.complete(),
      },

      -- completion sources
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' }
      },

      -- enable ghost text
      experimental = {
        ghost_text = true
      }
    }

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

    -- ==================
    -- === Neovim LSP ===
    -- ==================

    -- capabilities for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local servers = { 'pyright', 'rls', 'solargraph', 'sourcekit', 'tsserver' }

    -- add lsp servers
    for _, lsp in pairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach    = on_attach,
        capabilities = capabilities,
      }
    end

    -- diagnostics config
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      float = {
        source = 'always',
      },
    })

    -- ===============
    -- === Trouble ===
    -- ===============

    -- trouble ui
    trouble.setup {
      icons = false,
      padding = false,
      indent_lines = false,
      signs = {
        error       = '',
        warning     = '',
        hint        = 'ﴞ',
        information = '',
        other       = '',
      },
    }
