RANGE_FILE="/proc/sys/net/ipv4/ip_local_port_range"

local get_port_range = function()
	local file = io.open(RANGE_FILE, "r")
	local file_data = file:read "*a"
	
	local parsed_data = string.gmatch(file_data, "[^%s]+")
	local lower_port = parsed_data()
	local upper_port = parsed_data()

	file:close()

	return lower_port, upper_port
end

local get_unused_port = function(from_port, to_port)
	local sock = ngx.socket.tcp()
	for port = from_port, to_port do
		local ok, err = sock:bind("0.0.0.0", port)
		if ok then
			break
		end
	end
	sock:close()
	return port
end

local lower_port, upper_port = get_port_range() 
print(lower_port .. " -> " .. upper_port)

