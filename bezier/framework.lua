-- # variables
local curves = require(script.curves)
local p = workspace.points
local curve = workspace.curve

-- # functions
local setup = function()
	coroutine.wrap(function() curves.generate(curve.zip_1, p.cubic_1) end)()
	coroutine.wrap(function() curves.generate(curve.zip_2, p.quad_1) end)()
	coroutine.wrap(function() curves.generate(curve.zip_3, p.cubic_2) end)()
	coroutine.wrap(function() curves.generate(curve.zip_4, p.quad_2) end)()
end

-- # setup
setup()
