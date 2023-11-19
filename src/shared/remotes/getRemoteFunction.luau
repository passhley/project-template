local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local fnCache: { [string]: RemoteFunction? } = {}
local isServer = RunService:IsServer()

local function getEvents(): Folder
	local events = ReplicatedStorage:FindFirstChild("events")
	if events == nil then
		if isServer then
			events = Instance.new("Folder")
			assert(events, "")
			events.Name = "events"
			events.Parent = ReplicatedStorage
		else
			error("<getEvents> Could not find events folder.")
		end
	end

	return events :: Folder
end

local function getRemoteFunction(id: string): RemoteFunction
	local events = getEvents()
	local fn = fnCache[id]
	if fn ~= nil then
		return fn
	end

	for _, obj in events:GetChildren() do
		if obj:IsA("RemoteFunction") and obj.Name == id then
			fn = obj
			break
		end
	end

	if fn == nil then
		if isServer then
			fn = Instance.new("RemoteFunction")
			assert(fn, "")
			fn.Name = id
			fn.Parent = events
		else
			error("<getRemoteFunction> Could not find RemoteFunction: " .. id)
		end
	else
		fnCache[id] = fn
		if not isServer then
			fn.Name = HttpService:GenerateGUID(false)
		end
	end

	return fn :: RemoteFunction
end

return getRemoteFunction
