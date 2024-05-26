-- # variables
local i = require(script.interpolation)
local z = require(script)
local p = workspace.points

local curve = workspace.curve
local cubic = p.cubic
local quad = p.quad

local a, b, c, d

local generate = function(t, f) -- generate curves
	if t == "quad" then 
		a = quad.a.a.Position
		b = quad.b.Position
		c = quad.c.c.Position
		
		i.bezier({a, b, c}, "quad", f)
	end	
	
	if t == "cubic" then
		a = cubic.a.a.Position
		b = cubic.b.Position
		c = cubic.c.Position
		d = cubic.d.d.Position
		
		i.bezier({a, b, c, d}, "cubic", f)
	end	
end

-- run that function
generate("cubic", curve.zip_1)
generate("quad", curve.zip_2)
