-- plugin/up.lua

local up_by_name
up_by_name = function(current_dir, pattern)
	local current_dir_base = vim.fs.basename(current_dir)
	local parent_dir = vim.fs.dirname(current_dir)
	if pattern == "/" then return "/" end
	if pattern == "~" then return vim.fn.expand("~") end
	if pattern == ""  then return parent_dir end
	if current_dir_base == "" then return nil end
	if current_dir_base:match("^" .. pattern) then return current_dir end
	return up_by_name(parent_dir, pattern)
end

vim.api.nvim_create_user_command(
	"Up",
	function(opts)
		local current_dir = vim.fn.getcwd()
		local destination = up_by_name(current_dir, opts.args)
		if destination == nil then
			local message = "No parent directory matches \"" .. opts.args .. "\""
			vim.notify(message, vim.log.levels.WARN)
			return
		end
		vim.cmd("edit " .. destination)
	end,
	{
		nargs = "?",
		desc = "Navigate Up in the Directory Structure",
		complete = require "up-complete-function"
	}
)
