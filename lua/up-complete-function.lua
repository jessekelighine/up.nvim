-- lua/up-complete.lua

---@note complete function for command "Up".
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
