local function run(msg)
if msg.text == "121212" then
	return "121212"
end
if msg.text == "121212" then
	return "121212"
end
end
return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^121212$",
		
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
-- by @Iiborn
