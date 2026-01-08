---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	Pigui = require "pigui"
	b = Pigui.Button.new()

	love.graphics.setBackgroundColor(0.6, 0.3, 0.8)
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)

end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	b:draw()
end
