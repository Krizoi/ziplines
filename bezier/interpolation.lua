local interpolation = {}
local a, b, c, d, f, w, v, l, n

lerp = function(a, b, t) -- custom lerp function
	return (1 - t) * a + t * b
end

easing = function(i, j, k, t) -- easing for cubic 
	return lerp(lerp(i, j, t), lerp(j, k, t), t)
end

interpolation.bezier = function(p, s, f) -- making curves
	for i, v in pairs(p) do
		if i == 1 then a = v continue end		
		if i == 2 then b = v continue end
		
		if s == "quad" then -- depends on the style
			if i == 3 then c = v end	
		elseif s == "cubic" then
			if i == 3 then c = v continue end
			if i == 4 then d = v end	
		end
		
		if s == "quad" then -- styles
			l = nil	-- resets	
			for t = 0, 1.01, .01 do
				n = Instance.new("Part")
				w = lerp(lerp(a, b, t), lerp(b, c, t), t) -- formula
				
				n.Anchored = true
				n.CanCollide = false
				n.TopSurface = Enum.SurfaceType.SmoothNoOutlines
				n.Color = Color3.fromRGB(0,0,0)
				
				if l then -- if a position exists
					local s = (w - l)
					local cf = CFrame.new(l, w)
							
					n.Position = w
					n.Size = Vector3.new(.1, .1, s.Magnitude)
					n.CFrame = cf * CFrame.new(0, 0, -s.Magnitude / 2)
					n.Parent = f
				end
				
				l = w -- set formula
				task.wait()
			end
		end
		
		if s == "cubic" then -- style
			l = nil -- resets
			for t = 0, 1.01, .01 do
				n = Instance.new("Part")
				w = lerp(easing(a, b, c, t), easing(b, c, d, t), t) -- formula

				n.Anchored = true
				n.CanCollide = false
				n.TopSurface = Enum.SurfaceType.SmoothNoOutlines
				n.Color = Color3.fromRGB(0,0,0)

				if l then -- if a position exists
					local s = (w - l)
					local cf = CFrame.new(l, w)

					n.Position = w
					n.Size = Vector3.new(.1, .1, s.Magnitude)
					n.CFrame = cf * CFrame.new(0, 0, -s.Magnitude / 2)
					n.Parent = f
				end

				l = w -- set formula
				task.wait()
			end
		end
	end	
end

interpolation.clear_bezier = function(f) -- clears all parts in a specific folder
	f:ClearAllChildren()
end

return interpolation
