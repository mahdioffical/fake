local function block_by_reply(extra, success, result)
    local user_id = result.from.peer_id
    reply_msg(result.id, "User "..user_id.." has been blocked", ok_cb, true)
block_user("user#id"..user_id,ok_cb,false)
end

--By @SoLiD021
local function block_by_username(extra, success, result)
    local user_id = result.peer_id
    reply_msg(extra.msg.id, "User "..user_id.." has been blocked", ok_cb, true)
block_user("user#id"..user_id,ok_cb,false)
end

--By @SoLiD021
local function unblock_by_reply(extra, success, result)
          local user_id = result.from.peer_id
    reply_msg(result.id, "User "..user_id.." has been unblocked", ok_cb, true)
unblock_user("user#id"..user_id,ok_cb,false)
end

--By @SoLiD021
local function unblock_by_username(extra, success, result)
          local user_id = result.peer_id
    reply_msg(extra.msg.id, "User "..user_id.." has been unblocked", ok_cb, true)
unblock_user("user#id"..user_id,ok_cb,false)
end
if matches[1]:lower() == "pvblock" then
				local receiver = get_receiver(msg)
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				block = get_message(msg.reply_id, block_by_reply, {receiver = receiver, msg = msg})
			elseif matches[1]:lower() == "pvblock" and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
    reply_msg(msg.id, "User "..user_id.." has been blocked", ok_cb, true)
block_user("user#id"..user_id,ok_cb,false)
			elseif matches[1]:lower() == "pvblock" and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, block_by_username, {receiver = receiver, msg=msg})
			end
		end

--By @SoLiD021
		if matches[1]:lower() == "pvunblock" then
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				unblock = get_message(msg.reply_id, unblock_by_reply, {receiver = receiver, msg = msg})
			elseif matches[1]:lower() == "pvunblock" and string.match(matches[2], '^%d+$') then
      local user_id = matches[2]
    reply_msg(msg.id, "User "..user_id.." has been unblocked", ok_cb, true)
unblock_user("user#id"..user_id,ok_cb,false)
			elseif matches[1]:lower() == "pvunblock" and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, unblock_by_username, {receiver = receiver, msg=msg})
			end
		end 
   end 
   return {
    patterns = {
	"^[!/#](pvblock)$",
        "^[!/#](pvblock) (.*)$",
        "^[!/#](pvunblock)$",
        "^[!/#](pvunblock) (.*)$",
    },
      run = run,
}
