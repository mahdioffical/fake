local function run(msg, matches)
		  if msg.to.type == "user" then
fwd_msg("chat#id"..tonumber(fwd_to), msg.id,ok_cb,false)
 elseif msg.text and msg.reply_id and tonumber(msg.to.id) == fwd_to then
    if not msg.text then
    return "You can only send Text message" 
      end
    get_message(msg.reply_id, callback_message, msg)
    end
			    if matches[1] == "join" and is_sudo(msg) then
     local hash = parsed_url(matches[2])
     import_chat_link(hash,ok_cb,false)
  return reply_msg(msg.id, "Done!", ok_cb, false)
    end
    if msg then
              local data = load_data(_config.moderation.data)
      local receiver = get_receiver(msg)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
save_data(_config.moderation.data, data)
end
	if matches[1] == 's2a' then
		if is_sudo(msg) then
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				local user = 'user#id'..chat_id
				send_large_msg(chat, response)
				send_large_msg(user, response)
				send_large_msg(channel, response)
			end
		end
    end
if matches[1] == 'f2a' and is_sudo(msg) then
    if msg.reply_id then
        local response = msg.reply_id
    local data = load_data(_config.moderation.data)
			local groups = 'groups'
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				local user = 'user#id'..chat_id
				fwd_msg(chat, response ,ok_cb , false)
				fwd_msg(user, response ,ok_cb , false)
				fwd_msg(channel, response ,ok_cb , false)
		end
	end
end
    return nil
      end
return {
  patterns = {
"^(s2a) +(.+)$",
    "^(f2a)$",
},
  run = run
}