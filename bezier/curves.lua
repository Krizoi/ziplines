-- # variables
local curves = { }
local i = require(script.interpolation)
-- # functions
curves.generate = function(f, s)
	local function remove(x: string): string
		return ({x:gsub("%d", "")})[1]
	end
	
	local t = remove(s.Name)
	local x, y, n
	print(t)
	x = nil
	y = nil
	
	local pp = Instance.new("ProximityPrompt")
	pp.ActionText = "Ride"
	pp.ObjectText = "Zipline"
	pp.RequiresLineOfSight = false
	
	local anim = Instance.new("Animation")
	anim.AnimationId = "http://www.roblox.com/asset/?id=17652401202"
	
	local clone = s:Clone()
	clone.Parent = s.Parent
	
	local track = nil
	
	local m = 1.25
	local points = { }
	
	local a, b, c, d
	
	if t == "quad_" then
		points = {clone.a.a.Position, clone.b.Position, clone.c.c.Position}
		pp.Parent = clone.a.a
	elseif t == "cubic_" then
		points = {clone.a.a.Position, clone.b.Position, clone.c.Position, clone.d.d.Position}
		pp.Parent = clone.a.a
	end	
	
	i.bezier(points, t:gsub("_", ""), f)
	s:Destroy()
	
	pp.Triggered:Connect(function(plr)
		pp.Enabled = false
		
		local h = plr.Character:WaitForChild("Humanoid")
		local r = plr.Character:WaitForChild("HumanoidRootPart")
		
		track = h.Animator:LoadAnimation(anim)
		h.AutoRotate = false
		r.Anchored = true
		
		local zo = Vector3.new(0, r.Size.Y * m, 0)
		
		track:Play()
		
		local alpha =  .01
		
		local parts = f:GetChildren()
		for i = 1, #parts do
			x = parts[i]
			y = parts[i + 1]

			if y == nil then break end

			local pos_x = x.Position
			local pos_y = y.Position
		
			local lerp = pos_x:Lerp(pos_y, alpha) - zo
			local look = pos_y - zo
		
			local new = CFrame.new(lerp, look)
			r.CFrame = new
			
			game:GetService("RunService").Heartbeat:Wait()
			task.wait(0.03)
			
		end
		
		local final = parts[#parts].Position - zo
		r.CFrame = CFrame.new(final, final + Vector3.new(0, 0, -1))
		
		r.Anchored = false
		h.AutoRotate = true
		track:Stop()
		pp.Enabled = true
	end)	
end

return curves
