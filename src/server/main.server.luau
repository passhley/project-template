local getRemoteEvent = require("@shared/networking/getRemoteEvent")
local getRemoteFunction = require("@shared/networking/getRemoteFunction")
local makeHello = require("@shared/makeHello")

local testEvent = getRemoteEvent("TestEvent")
local testFn = getRemoteFunction("TestFunction")

testFn.OnServerInvoke = function(_, value: number)
	print("<server> Got value:", value)
	return value * 2
end

testEvent.OnServerEvent:Connect(function(_, value: number)
	print("<server> TestEvent received value:", value)
end)

print(makeHello("server"))
