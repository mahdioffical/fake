local function run(msg)
if msg.text == "Abbas" then
	return "bale"
end
if msg.text == "abbas" then
	return "bale"
end
if msg.text == "Abas" then
	return "bale"
end
if msg.text == "abas" then
	return "bale"
end
if msg.text == "aren" then
	return "yes"
end
if msg.text == "Aren" then
	return "bale"
end
if msg.text == "@Iiborn" then
	return "yes"
end
if msg.text == "عباس" then
    return "بله"
end
end
return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Aa]bbas$",
		"^[Aa]bas$",
		"^[Aa]ren$",
		"^@Iiborn$",
		"^عباس$",
		
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
