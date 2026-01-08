---@class Pigui.StyleOptions
---@field color? Pigui.Color
---@field background_color? Pigui.Color

---@class Pigui.Style : Pigui.Style__Field
local Style = {}
Style.__index = Style

---@type Pigui
Style.parent = nil

Style.init = function(parent)
	Style.parent = parent
	return Style
end

---@param options? Pigui.StyleOptions
Style.new = function(options)
	options = options or {}

	---@class Pigui.Style__Field
	local instance = {}

	local default_color = Style.parent.Color.new("#ffffff")

	instance.color = options.color or default_color
	instance.background_color = options.background_color or default_color

	setmetatable(instance, Style)
	return instance ---@type Pigui.Style
end

return Style
