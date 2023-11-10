local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local eventCache: { [string]: RemoteEvent? } = {}
local isServer = RunService:IsServer()

local function getEvents(): Folder
	local events = ReplicatedStorage:FindFirstChild("events")
	if events == nil then
		if isServer then
			events = Instance.new("Folder")
			events.Name = "events"
			events.Parent = ReplicatedStorage
		else
			error("<getEvents> Could not find events folder.")
		end
	end

	return events
end

local function getRemoteEvent(id: string): RemoteEvent
	local events = getEvents()
	local event = eventCache[id]
	if event ~= nil then
		return event
	end

	for _, obj in events:GetChildren() do
		if obj:IsA("RemoteEvent") and obj.Name == id then
			event = obj
			break
		end
	end

	if event == nil then
		if isServer then
			event = Instance.new("RemoteEvent")
			assert(event, "")
			event.Name = id
			event.Parent = events
		else
			error("<getRemoteEvent> Could not find RemoteEvent: " .. id)
		end
	else
		eventCache[id] = event
		if not isServer then
			event.Name = HttpService:GenerateGUID(false)
		end
	end

	return event :: RemoteEvent
end

return getRemoteEvent
