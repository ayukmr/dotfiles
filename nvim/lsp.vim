" ==================
" === Neovim LSP ===
" ==================

" ======================
" === Cmp Completion ===
" ======================

" highlight matching text
highlight CmpItemAbbrMatch cterm=bold gui=bold

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
    -- ======================
    -- === Cmp Completion ===
    -- ======================

    -- cmp modules
    local cmp          = require 'cmp'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

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

    -- completion
    cmp.setup({
        -- use ultisnips
        snippet = {
            expand = function(args)
                vim.fn['UltiSnips#Anon'](args.body)
            end,
        },

        -- show icons for items
        formatting = {
            format = function(_, item)
                item.kind = symbols[item.kind]
                return item
            end,
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
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' },
            { name = 'buffer' },
            { name = 'path' },
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

    -- ============================
    -- === Neovim LSP Installer ===
    -- ============================

    -- lsp installer module
    local nvim_lsp_installer = require 'nvim-lsp-installer'

    -- setup lsp installer
    nvim_lsp_installer.setup({
        automatic_installation = true,
        ui = {
            icons = {
                server_installed   = '',
                server_pending     = '',
                server_uninstalled = '',
            },
        },
    })

    -- =================
    -- === LSPConfig ===
    -- =================

    -- lspconfig module
    local lspconfig = require 'lspconfig'

    -- capabilities for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    local servers = { 'pyright', 'rls', 'solargraph', 'sourcekit', 'tsserver' }

    -- add lsp servers
    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup({
            capabilities = capabilities,
        })
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

    -- trouble module
    local trouble = require 'trouble'

    -- trouble ui
    trouble.setup({
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
    })
EOF
