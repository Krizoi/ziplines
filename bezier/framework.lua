-- # variables
local curves = require(script.curves)
local p = workspace.points
local curve = workspace.curve

-- # functions
local setup = function()
	coroutine.wrap(function() curves.generate("cubic", curve.zip_1, p.cubic_1, p) end)()
	coroutine.wrap(function() curves.generate("quad", curve.zip_2, p.quad_1, p) end)()
	coroutine.wrap(function() curves.generate("cubic", curve.zip_3, p.cubic_2, p) end)()
	coroutine.wrap(function() curves.generate("quad", curve.zip_4, p.quad_2, p) end)()
end

-- # setup
setup()
