M = {}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.solarized_dark")
if not status_theme_ok then
	return
end

-- check if value in table
local function contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end
	return false
end

local hl_str = function(str, hl)
	return "%#" .. hl .. "#" .. str .. "%*"
end

local icons = require("user.icons")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = {
		error = "%#SLError#" .. icons.diagnostics.Error .. "%*" .. " ",
		warn = "%#SLWarning#" .. icons.diagnostics.Warning .. "%*" .. " ",
	},
	colored = false,
	update_in_insert = false,
	always_visible = true,
	padding = 1,
}

local hide_in_width = function()
	return vim.o.columns > 80
end

local hide_in_width_100 = function()
	return vim.o.columns > 100
end

local lanuage_server = {
	function()
		local buf_ft = vim.bo.filetype
		local ui_filetypes = {
			"help",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
			"lspinfo",
			"lsp-installer",
			"",
		}

		if contains(ui_filetypes, buf_ft) then
			if M.language_servers == nil then
				return ""
			else
				return M.language_servers
			end
		end

		local clients = vim.lsp.buf_get_clients()
		local client_names = {}
		local copilot_active = false

		-- add client
		for _, client in pairs(clients) do
			if client.name ~= "copilot" and client.name ~= "null-ls" then
				table.insert(client_names, client.name)
			end
			if client.name == "copilot" then
				copilot_active = true
			end
		end

		-- add formatter
		local s = require("null-ls.sources")
		local available_sources = s.get_available(buf_ft)
		local registered = {}
		for _, source in ipairs(available_sources) do
			for method in pairs(source.methods) do
				registered[method] = registered[method] or {}
				table.insert(registered[method], source.name)
			end
		end

		local formatter = registered["NULL_LS_FORMATTING"]
		local linter = registered["NULL_LS_DIAGNOSTICS"]
		if formatter ~= nil then
			vim.list_extend(client_names, formatter)
		end
		if linter ~= nil then
			vim.list_extend(client_names, linter)
		end

		-- join client names with commas
		local client_names_str = table.concat(client_names, ", ")

		-- check client_names_str if empty
		local language_servers = ""
		local client_names_str_len = #client_names_str
		if client_names_str_len ~= 0 then
			language_servers = hl_str(" ", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str(" ", "SLSep")
		end
		if copilot_active then
			language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
		end

		if client_names_str_len == 0 and not copilot_active then
			return ""
		else
			M.language_servers = language_servers
			return language_servers:gsub(", anonymous source", "")
		end
	end,
	padding = 0,
	cond = hide_in_width,
	separator = "%#SLSeparator#" .. " " .. "%*",
}

local current_signature = {
	function()
		local buf_ft = vim.bo.filetype

		if buf_ft == "toggleterm" or buf_ft == "TelescopePrompt" then
			return ""
		end
		if not pcall(require, "lsp_signature") then
			return ""
		end
		local sig = require("lsp_signature").status_line(30)
		local hint = sig.hint

		if not require("user.functions").isempty(hint) then
			-- return "%#SLSeparator#│ : " .. hint .. "%*"
			-- return "%#SLSeparator#│ " .. hint .. "%*"
			return "%#SLSeparator# " .. hint .. "%*"
		end

		return ""
	end,
	cond = hide_in_width_100,
	padding = 0,
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", diagnostics },
		lualine_c = { current_signature },
		lualine_x = { lanuage_server, "spaces", "filetype" },
		lualine_y = {},
		lualine_z = { "location", "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
