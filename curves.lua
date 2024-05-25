-- # variables
local i = require(script.interpolation)
local p = workspace.points

local a, b, c, d

-- # functions
local generate = function() -- generate and setting up variables
	a = p.a.a.Position
	b = p.b.Position
	c = p.c.c.Position
	d = p.d.Position -- in case you want another point to modify
	
	i.bezier({a, b, c})
end

while true do -- loop: generate curves, wait, remove curves
	generate()
	task.wait(7)
	i.clear_bezier()
end
