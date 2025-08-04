-- lua/up.lua

local module = {}

---Creates a keybinding for the "Up" command.
---@param lhs string The left-hand side keybinding to set for the "Up" command.
---@return nil
module.map = function(lhs)
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
	end, { desc = "Navigate Up in the Directory Structure" })
end

return module
