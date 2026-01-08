---@class Pigui.ButtonOptions
---@field x? number
---@field y? number
---@field width? number
---@field height? number

---@class Pigui.Button : Pigui.Button__Field
local Button = {}
Button.__index = Button

---@param fun fun(T: Pigui.Button)
Button.on_hover = function(self, fun)
	self.handler__on_hover = fun
end
---@param fun fun(T: Pigui.Button)
Button.on_press = function(self, fun)
	self.handler__on_press = fun
end
---@param fun fun(T: Pigui.Button)
Button.on_release = function(self, fun)
	self.handler__on_release = fun
end

---@param T Pigui.Button
---@param x number
---@param y number
local function check_touch(T, x, y)
	return x > T.x and x < T.x + T.width and y > T.y and y < T.y + T.height
end

Button.hovered = function(self, id, x, y)
	if check_touch(self, x, y) then
		self.id = id
		if self.handler__on_hover then self.handler__on_hover(self) end
	end
end
Button.pressed = function(self, id, x, y)
	if check_touch(self, x, y) then
		self.id = id
		if self.handler__on_press then self.handler__on_press(self) end
	end
end
---@diagnostic disable-next-line : unused-local
Button.released = function(self, id, x, y)
	--- In released not need to check touch position
	if id == self.id then
		if self.handler__on_release then self.handler__on_release(self) end
	end
end

local love_graphics = love.graphics

Button.draw = function(self)
	local x = self.y
	local y = self.y
	local width = self.width
	local height = self.height

	love_graphics.push()
	--- Make the draw origin in center
	love_graphics.translate(x + width / 2, y + height / 2)
	love_graphics.rectangle("line", x - width / 2, y - height / 2, width, height)

	love_graphics.pop()
end

---@param options? Pigui.ButtonOptions
Button.new = function(options)
	options = options or {}

	---@class Pigui.Button__Field
	local instance = {}
	instance.x = options.x or 50
	instance.y = options.y or 50
	instance.width = options.width or 50
	instance.height = options.height or 50

	instance.id = nil
	instance.is_press = false

	instance.handler__on_hover = nil
	instance.handler__on_press = nil
	instance.handler__on_release = nil

	setmetatable(instance, Button)
	return instance ---@type Pigui.Button
end

return Button
