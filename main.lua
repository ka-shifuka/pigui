---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	Pigui = require "pigui"
	Color = Pigui.Color
	Style = Pigui.Style

	b = Pigui.Button.new({
		x = 100,
		y = 100,
		width = 200,
		height = 100,
	})

	love.graphics.setBackgroundColor(0.4, 0.1, 0.6)
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)

end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	b:draw()
end
