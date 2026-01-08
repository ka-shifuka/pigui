---@class Pigui.Color : Pigui.Color__Field
local Color = {}
Color.__index = Color

---@type Pigui
Color.parent = nil

Color.init = function(parent)
	Color.parent = parent
	return Color
end

Color.new = function(color_hex)
	color_hex = color_hex:gsub("#", "")

	local r = tonumber(color_hex:sub(1, 2), 16) / 255
	local g = tonumber(color_hex:sub(3, 4), 16) / 255
	local b = tonumber(color_hex:sub(5, 6), 16) / 255
	local a = 1

	if #color_hex == 8 then
		a = tonumber(color_hex:sub(7, 8), 16) / 255
	end

	---@class Pigui.Color__Field
	local instance = {}
	instance.r = r
	instance.g = g
	instance.b = b
	instance.a = a

	setmetatable(instance, Color)
	return instance ---@type Pigui.Color
end

return Color
