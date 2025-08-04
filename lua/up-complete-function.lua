-- lua/up-complete.lua

---Competition function for "Up" command.
---@param arg_lead string The prefix to match against directory names.
---@return string[] matches: List of directory names that match the input prefix.
local complete_function = function(arg_lead)
	local current_dir = vim.fn.getcwd()
	local directories = vim.fn.reverse(vim.fn.split(current_dir, "/"))
	local matches = {}
	for _, dir in ipairs(directories) do
		if dir:match("^" .. arg_lead) then
			table.insert(matches, dir)
		end
	end
	return matches
end

return complete_function
