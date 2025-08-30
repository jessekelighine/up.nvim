-- plugin/up.lua

local up_by_name

---Recursively searches for a parent directory that matches the given pattern.
---@param current_dir string The current directory to start searching from.
---@param pattern string The pattern to match against directory names.
---@return string|nil path to the matching parent directory, or nil if not found.
up_by_name = function(current_dir, pattern)
	local current_dir_base = vim.fs.basename(current_dir)
	local parent_dir = vim.fs.dirname(current_dir)
	if pattern == "/" then return "/" end
	if pattern == "~" then return vim.fn.expand("~") end
	if pattern == ""  then return parent_dir end
	if current_dir_base == "" then return nil end
	if vim.fn.match(current_dir_base, "^\\M" .. pattern) >= 0 then return current_dir end
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
		vim.cmd("cd " .. destination)
		vim.cmd("edit " .. destination)
	end,
	{
		nargs = "?",
		desc = "Navigate Up in the Directory Structure",
		complete = require "up-complete-function"
	}
)
