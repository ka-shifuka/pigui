local CWD = (...):gsub('%.init$', '') .. "."

---@type Pigui.Button
local Button = require(CWD .. "button")
---@type Pigui.Color
local Color = require(CWD .. "color")
---@type Pigui.Style
local Style = require(CWD .. "style")

---@class Pigui
local Pigui = {}

Pigui.Button = Button.init(Pigui)
Pigui.Color = Color.init(Pigui)
Pigui.Style = Style.init(Pigui)

return Pigui
