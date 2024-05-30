local interpolation = {}

lerp = function(a, b, t)	
	return (1 - t) * a + t * b
end

easing = function(i, j, k, t)
	return lerp(lerp(i, j, t), lerp(j, k, t), t)
end

interpolation.bezier = function(p, s, f)
	local a, b, c, d, v, x
	for i, v in pairs(p) do
		x = 0
		if i == 1 then a = v continue end		
		if i == 2 then b = v continue end
		
		if s == "quad" then
			if i == 3 then c = v end	
		elseif s == "cubic" then
			if i == 3 then c = v continue end
			if i == 4 then d = v end	
		end
		
		if s == "quad" then
			local l = nil		
			for t = 0, 1.02, .02 do
				local n = Instance.new("Part")
				local w = easing(a, b, c, t)
				
				
				n.Anchored = true
				n.CanCollide = false
				n.TopSurface = Enum.SurfaceType.SmoothNoOutlines
				n.Color = Color3.fromRGB(0,0,0)
				n.Name = x + 1
				
				if l then
					local s = (w - l)
					local cf = CFrame.new(l, w)
							
					n.Position = w
					n.Size = Vector3.new(.1, .1, s.Magnitude)
					n.CFrame = cf * CFrame.new(0, 0, -s.Magnitude / 2)
					n.Parent = f
				end
				
				l = w
				task.wait()
			end

		end
		
		if s == "cubic" then
			local l = nil
			for t = 0, 1.02, .02 do
				local n = Instance.new("Part")
				local w = lerp(easing(a, b, c, t), easing(b, c, d, t), t)

				n.Anchored = true
				n.CanCollide = false
				n.TopSurface = Enum.SurfaceType.SmoothNoOutlines
				n.Color = Color3.fromRGB(0,0,0)
				n.Name = x + 1

				if l then
					local s = (w - l)
					local cf = CFrame.new(l, w)

					n.Position = w
					n.Size = Vector3.new(.1, .1, s.Magnitude)
					n.CFrame = cf * CFrame.new(0, 0, -s.Magnitude / 2)
					n.Parent = f
				end

				l = w
				task.wait()
			end
		end
		
		for i, v in ipairs(f:GetChildren()) do
			v.Name = tostring(i)
		end
		
	end	
end

interpolation.clear_bezier = function(but_ignore)
	for i, v in pairs(workspace.curve:GetChildren()) do
		if but_ignore and v:IsA("Folder") and v.Name == tostring(but_ignore) then
			continue
		else
			v:ClearAllChildren()
		end
	end
end

return interpolation
