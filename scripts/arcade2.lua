local function createPart(name, size, pos, rot)
	local p = Instance.new("Part")
	p.Name = name
	p.Size = Vector3.new(size[1], size[2], size[3])
	p.Position = Vector3.new(pos[1], pos[2], pos[3])
	p.Anchored = true

	if rot then
		p.Orientation = Vector3.new(rot[1], rot[2], rot[3])
	end

	p.Parent = workspace
	return p
end

local function setPart(part, size, pos, rot)
	if not part then
		return
	end

	part.Size = Vector3.new(size[1], size[2], size[3])
	part.Position = Vector3.new(pos[1], pos[2], pos[3])

	if rot then
		part.Orientation = Vector3.new(rot[1], rot[2], rot[3])
	end
end

-- references
local gameFolder = workspace.Games["Goal Galore"]

local g1 = gameFolder["1"]
local g2 = gameFolder["2"]
local function sizesApproximatelyEqual(size1, size2, tolerance)
	tolerance = tolerance or 0.01
	return math.abs(size1.X - size2.X) < tolerance
		and math.abs(size1.Y - size2.Y) < tolerance
		and math.abs(size1.Z - size2.Z) < tolerance
end
-- === SET 1 (CREATE) ===
createPart("goal blocker 1", { 7.8, 3.9, 2 }, { -4.4444566, 19.5236473, -121.7572937 })

createPart("funnel 1-1", { 4.6, 1, 0.3 }, { -6.1898279, 17.7422924, -117.996933 }, { 0, -50, 0 })
createPart("funnel 2-1", { 4.3, 1, 0.2 }, { -2.2644973, 17.7422924, -118.0933228 }, { 0, 56, 0 })

createPart("guide 1-1", { 2.3, 2.6, 3.6 }, { -5.7264004, 18.1738625, -114.5262604 })
createPart("guide 2-1", { 2.5, 2.6, 3.6 }, { -2.3266132, 18.1738625, -114.5175476 })

-- === SET 1 (MODIFY) ===
setPart(g1.GoalDrain, { 8.4, 0.2, 2 }, { -4.7999706, 16.2000237, -112.0000305 })
setPart(g1.BallSensors["4"], { 1, 0.5, 0.4 }, { -4.0999708, 17.3500233, -112.8999786 })
setPart(g1.BallDrain, { 0.1, 0.2, 1.4 }, { -3.9499898, 16.3000240, -112.0000153 })

local pins = workspace.Games["Goal Galore"]["1"]:GetChildren()[5]
for _, pin in pairs(pins:GetChildren()) do
	if pin.Name == "Pins" then
		pin:Destroy()
	end
end
for _, part in pairs(g1:GetChildren()) do
	if part.Name == "Wedge" and sizesApproximatelyEqual(part.Size, Vector3.new(0.6, 0.2, 0.2)) then
		part:Destroy()
	end
	if part.Name == "Part" and sizesApproximatelyEqual(part.Size, Vector3.new(0.2, 0.6, 1.5)) then
		part:Destroy()
	end
end

-- === SET 2 (CREATE) ===
createPart("goal blocker 2", { 7.8, 3.9, 2 }, { 9.7555428, 19.5236473, -121.7572937 })

createPart("funnel 1-2", { 4.6, 1, 0.3 }, { 7.6101718, 17.7422924, -117.996933 }, { 0, -50, 0 })
createPart("funnel 2-2", { 4.3, 1, 0.2 }, { 11.5355034, 17.7422924, -118.0933228 }, { 0, 56, 0 })

createPart("guide 1-2", { 2.3, 2.6, 3.6 }, { 8.0735989, 18.1738625, -114.5262604 })
createPart("guide 2-2", { 2.5, 2.6, 3.6 }, { 11.4733858, 18.1738625, -114.5175476 })

-- === SET 2 (MODIFY) ===
setPart(g2.GoalDrain, { 6.7, 0.2, 2 }, { 9.8500462, 16.1000423, -112.0000305 })
setPart(g2.BallSensors["4"], { 1.1, 0.5, 0.4 }, { 9.7500477, 17.3500423, -112.8999786 })
setPart(g2.BallDrain, { 0.1, 0.2, 1.4 }, { 9.65006828, 16.2000427, -112.000015 })

local pins2 = workspace.Games["Goal Galore"]["2"]:GetChildren()[5]
for _, pin in pairs(pins2:GetChildren()) do
	if pin.Name == "Pins" then
		pin:Destroy()
	end
end

for _, part in pairs(g2:GetChildren()) do
	if part.Name == "Wedge" and sizesApproximatelyEqual(part.Size, Vector3.new(0.6, 0.2, 0.2)) then
		part:Destroy()
	end

	if part.Name == "Part" and sizesApproximatelyEqual(part.Size, Vector3.new(0.2, 0.6, 1.5)) then
		part:Destroy()
	end
end
