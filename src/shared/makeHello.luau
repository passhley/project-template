local function makeHello(from: string): string
	return string.format("<%s> Hello, world!", from)
end

return makeHello
