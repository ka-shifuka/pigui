---@class Pigui.ButtonOptions
---@field x? number
---@field y? number
---@field width? number
---@field height? number
---
---@field style? Pigui.Style

---@class Pigui.Button : Pigui.Button__Field
local Button = {}
Button.__index = Button

---@type Pigui
Button.parent = nil

---@param fun fun(self: Pigui.Button)
Button.on_press = function(self, fun)
	self.handler__on_press = fun
	return self
end
---@param fun fun(self: Pigui.Button)
Button.on_release = function(self, fun)
	self.handler__on_release = fun
	return self
end

---@param T Pigui.Button
---@param x number
---@param y number
local function check_touch(T, x, y)
	return x > T.x and x < T.x + T.width and y > T.y and y < T.y + T.height
end

Button.pressed = function(self, id, x, y)
	if self.id then return end

	if check_touch(self, x, y) then
		self.id = id
		self.touch_info.id = id
		self.touch_info.x = x
		self.touch_info.y = y

		if self.handler__on_press then self.handler__on_press(self) end
	end
end
---@diagnostic disable-next-line : unused-local
Button.released = function(self, id, x, y)
	--- In released not need to check touch position
	if id == self.id then
		self.touch_info.id = id
		self.touch_info.x = x
		self.touch_info.y = y

		self.id = nil
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

	local bg_color = self.style.background_color
	love_graphics.setColor(bg_color.r, bg_color.g, bg_color.b, bg_color.a)
	--- Background
	love_graphics.rectangle("fill", x - width / 2, y - height / 2, width, height)
	--- Border
	love_graphics.rectangle("line", x - width / 2, y - height / 2, width, height)

	love_graphics.setColor(1, 1, 1, 1)
	love_graphics.pop()
end

Button.init = function(parent)
	Button.parent = parent
	return Button
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

	instance.style = options.style or Button.parent.Style.new()

	instance.id = nil
	instance.is_press = false

	instance.handler__on_press = nil
	instance.handler__on_release = nil

	instance.touch_info = {
		id = nil,
		x = 0,
		y = 0,
	}

	setmetatable(instance, Button)
	return instance ---@type Pigui.Button
end

return Button
