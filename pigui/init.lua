local current_working_dir = (...):gsub('%.init$', '') .. "."

---@type Pigui.Button
local Button = require(current_working_dir .. "button")

---@class Pigui
local Pigui = {}
Pigui.Button = Button

return Pigui
