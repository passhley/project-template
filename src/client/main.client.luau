local getRemoteEvent = require("@shared/networking/getRemoteEvent")
local getRemoteFunction = require("@shared/networking/getRemoteFunction")
local makeHello = require("@shared/makeHello")

local testEvent = getRemoteEvent("TestEvent")
local testFn = getRemoteFunction("TestFunction")

local returnValue = testFn:InvokeServer(5)
print("<client> Invoked TestFunction, Got: " .. returnValue)
testEvent:FireServer(returnValue)

print(makeHello("server"))
