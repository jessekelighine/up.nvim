-- lua/up.lua

local module = {}

module.map = function(lhs)
	local desc = "Navigate Up in the Directory Structure"
	vim.keymap.set("n", lhs, function()
		vim.ui.input(
			{
				prompt = "Up: ",
				default = "",
				completion = "customlist,v:lua.require'up-complete-function'",
			},
			function(input)
				if input then
					vim.cmd("Up " .. input)
				end
			end
		)
	end, { desc = desc })
end

return module
