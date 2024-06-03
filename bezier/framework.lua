--[[

THIS IS AN EXAMPLE SCRIPT

]]

-- # variables
local curves = require(script.curves)
local p = workspace.points

local x = 0
local id = tostring(17652401202)
local m = 1.05

-- # functions
local setup = function()
	local func = curves:new()
	func.id = id
	func.m = m
	
	coroutine.wrap(function() func:generate(p.cubic_1) end)()
	coroutine.wrap(function() func:generate(p.quad_1) end)()
	coroutine.wrap(function() func:generate(p.cubic_2) end)()
	coroutine.wrap(function() func:generate(p.quad_2) end)()
	coroutine.wrap(function() func:generate(p.cubic_3) end)()
	coroutine.wrap(function() func:generate(p.quad_3) end)()
end

-- # setup
setup()
