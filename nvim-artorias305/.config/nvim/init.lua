-- Set map leader
vim.g.mapleader = " "

-- Options
require("config")
require("functions")
require("plugins")

--
-- Native vim 012 ui2
--
-- Replace noice
--
require("vim._core.ui2").enable({
	enable = true, -- Whether to enable or disable the UI.
	msg = { -- Options related to the message module.
		---@type 'cmd'|'msg' Default message target, either in the
		---cmdline or in a separate ephemeral message window.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds and triggers to a target.
		targets = "cmd",
		cmd = { -- Options related to messages in the cmdline window.
			height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
		},
		dialog = { -- Options related to dialog window.
			height = 0.5, -- Maximum height.
		},
		msg = { -- Options related to msg window.
			height = 0.5, -- Maximum height.
			timeout = 4000, -- Time a message is visible in the message window.
		},
		pager = { -- Options related to message window.
			height = 1, -- Maximum height.
		},
	},
})

vim.opt.completeopt:append("popup")

--
-- Statusline setup
--

-- Native vim 0.12 autocompletion
-- We don't need this is we use blink
-- opt.autocomplete = true

-- mason autoconfig does this but does not do autotrigger
-- We don't need this is we use blink
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--         end
--     end,
-- })

-- opt.complete:append('o')
-- opt.completeopt = "menuone,noinsert,noselect"
