local interpolation = {}
local a, b, c, d, w, v, l, n

lerp = function(a, b, t)	-- custom lerp for formula
	return (1 - t) * a + t * b
end

interpolation.bezier = function(p) -- uses a table of points to determine to use the quad or cubic curves, then make the curves
	for i, v in pairs(p) do
    -- giving variables the values
		if i == 1 then a = v continue end		
		if i == 2 then b = v continue end

		if i == 3 then
			c = v
			if i ~= 4 then
				l = nil -- reset
				for t = 0, 1.01, .01 do -- iteration, included 1.01 to be more accurate when the curves finish
					n = Instance.new("Part")
					w = lerp(lerp(a, b, t), lerp(b, c, t), t) -- formula
          
          -- properties
					n.Anchored = true
					n.CanCollide = false
					n.TopSurface = Enum.SurfaceType.SmoothNoOutlines
					n.Color = Color3.fromRGB(0,0,0)
					
					if l then -- if there was a position before after the first iteration
						local d = (w - l)
						local cf = CFrame.new(l, w)
								
						n.Position = w
						n.Size = Vector3.new(.1, .1, d.Magnitude)
						n.CFrame = cf * CFrame.new(0, 0, -d.Magnitude / 2) -- curving
						n.Parent = workspace.curve
					end
					
					l = w -- equals formula
					task.wait()
				end
			end
			
			if i == 4 then
				-- haven't made it yet
			end
		end
	end	
end

interpolation.clear_bezier = function() -- clears the curves in the folder, making a new proper variable soon
  workspace.curve:ClearAllChildren()
end

return interpolation
