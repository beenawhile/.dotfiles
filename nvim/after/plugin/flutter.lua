local flutter_tools = require'flutter-tools'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- autoformat on save
vim.g.dart_format_on_save = 1

flutter_tools.setup {
	lsp = {
		capabilities = capabilities,
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
    		enabled = true,
    		-- run_via_dap = true, -- use dap instead of a plenary job to run flutter apps 
  	},
}

vim.keymap.set('n', '<leader>fr',':FlutterRun<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc',[[<Cmd>lua require('telescope').extensions.flutter.commands()<CR>]], opts)

