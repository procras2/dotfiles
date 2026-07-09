require("functions.highlight_on_yank")
require("functions.return_to_last_cursor_position")
require("functions.wrap_linebreak_spell_md_txt")
-- require("functions.show_lsp_progress")
require("functions.my.multicursor")

--
-- Function to delete unused plugins
--
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

-- pack_clean()
