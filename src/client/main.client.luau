local getRemoteEvent = require("@shared/remotes/getRemoteEvent")
local getRemoteFunction = require("@shared/remotes/getRemoteFunction")
local makeHello = require("@shared/makeHello")

local testEvent = getRemoteEvent("TestEvent")
local testFn = getRemoteFunction("TestFunction")

local returnValue = testFn:InvokeServer(5)
print("<client> Invoked TestFunction, Got: " .. returnValue)
testEvent:FireServer(returnValue)

print(makeHello("server"))
