---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	Pigui = require "pigui"
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)

end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	love.graphics.print(Pigui.cwd, 50, 50)
	love.graphics.print(Pigui.idk, 50, 60)
end
