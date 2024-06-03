-- # variables
local curves = { }
local i = require(script.interpolation)
-- # functions
local function remove(x)
	return ({x:gsub("%d", "")})[1]
end

function curves:new()
	self = {
		id = nil,
		m = nil
	}
	
	return setmetatable(self, {__index = curves})
end

function curves:generate(s)
	local id = self.id
	local m = self.m
	local t = remove(s.Name)
	t = t:gsub("_", "")

	local x, y, n
	local f = 0
	x = nil
	y = nil
	
	local pp = Instance.new("ProximityPrompt")
	pp.ActionText = "Ride"
	pp.ObjectText = "Zipline"
	pp.RequiresLineOfSight = false
	
	local anim = Instance.new("Animation")
	anim.AnimationId = "http://www.roblox.com/asset/?id=".. id
	
	local track = nil
	
	local clone = s:Clone()
	clone.Parent = s.Parent

	local points = { }
	
	if t == "quad" then
		points = {clone.points.a.a.Position, clone.points.b.Position, clone.points.c.c.Position}
		pp.Parent = clone.points.a.a
	elseif t == "cubic" then
		points = {clone.points.a.a.Position, clone.points.b.Position, clone.points.c.Position, clone.points.d.d.Position}
		pp.Parent = clone.points.a.a
	end	
	
	i.bezier(points, t, clone)
	s:Destroy()
	
	pp.Triggered:Connect(function(plr)
		pp.Enabled = false
		
		local h = plr.Character:WaitForChild("Humanoid")
		local r = plr.Character:WaitForChild("HumanoidRootPart")
		local l = pp.Parent.Parent.Parent
		
		track = h.Animator:LoadAnimation(anim)
		
		h.AutoRotate = false
		r.Anchored = true
		
		local zo = Vector3.new(0, r.Size.Y * m, 0)
		
		track:Play()
		
		local alpha =  .01
		local parts = clone.curve:GetChildren()
		
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
			task.wait(0.0325)
			
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
