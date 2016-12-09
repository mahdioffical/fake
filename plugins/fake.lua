do

local fwd_to = 1084736802

	
	local function get_contact_list_callback (cb_extra, success, result)
  local text = " "
  for k,v in pairs(result) do
    if v.print_name and v.id and v.phone then
      text = text..string.gsub(v.print_name ,  "_" , " ").." ["..v.id.."] = "..v.phone.."\n"
    end
  end
  local file = io.open("contact_list.txt", "w")
  file:write(text)
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"contact_list.txt", ok_cb, false)--.txt format
  local file = io.open("contact_list.json", "w")
  file:write(json:encode_pretty(result))
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"contact_list.json", ok_cb, false)--json format
end

local function get_dialog_list_callback(cb_extra, success, result)
  local text = ""
  for k,v in pairsByKeys(result) do
    if v.peer then
      if v.peer.type == "chat" then
        text = text.."group{"..v.peer.title.."}["..v.peer.id.."]("..v.peer.members_num..")"
      else
        if v.peer.print_name and v.peer.id then
          text = text.."user{"..v.peer.print_name.."}["..v.peer.id.."]"
        end
        if v.peer.username then
          text = text.."("..v.peer.username..")"
        end
        if v.peer.phone then
          text = text.."'"..v.peer.phone.."'"
        end
      end
    end
    if v.message then
      text = text..'\nlast msg >\nmsg id = '..v.message.id
      if v.message.text then
        text = text .. "\n text = "..v.message.text
      end
      if v.message.action then
        text = text.."\n"..serpent.block(v.message.action, {comment=false})
      end
      if v.message.from then
        if v.message.from.print_name then
          text = text.."\n From > \n"..string.gsub(v.message.from.print_name, "_"," ").."["..v.message.from.id.."]"
        end
        if v.message.from.username then
          text = text.."( "..v.message.from.username.." )"
        end
        if v.message.from.phone then
          text = text.."' "..v.message.from.phone.." '"
        end
      end
    end
    text = text.."\n\n"
  end
  local file = io.open("dialog_list.txt", "w")
  file:write(text)
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"dialog_list.txt", ok_cb, false)--.txt format
  local file = io.open("dialog_list.json", "w")
  file:write(json:encode_pretty(result))
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"dialog_list.json", ok_cb, false)--json format
end
local function parsed_url(link)
  local parsed_link = URL.parse(link)
  local parsed_path = URL.parse_path(parsed_link.path)
  return parsed_path[2]
end

local function get_variables_hash(msg)
    return 'cmd:variables'
end 
local function save_value(msg, name, value)
  if (not name or not value) then
    return nil
  end
    local hash = 'cmd:variables'
  if hash then
    redis:hset(hash, name, value)
    return "Saved "..name
  end
end

local function get_value(msg, var_name)
  local hash = get_variables_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return
    else
      return value
    end
  end
end

local function del_value(msg, name)
    local hash = 'cmd:variables'
  if hash then
    redis:hdel(hash, name, get_value(msg, name))
    return "Deleted "..name
  end
end
	local function callback_message(extra,success,result)
local receiver = result.to.id
local msg = extra
  if result.fwd_from then
  send_msg(result.fwd_from.id, msg.text, ok_cb,false)
  else
    return nil
      end
  end
local function run(msg, matches)
		  if msg.to.type == "user" then
fwd_msg("channel#id"..tonumber(fwd_to), msg.id,ok_cb,false)
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
		if matches[1]:lower() == "addcontact" and is_sudo(msg) then
    phone = matches[2]
    first_name = matches[3]
    last_name = matches[4]
    add_contact(phone, first_name, last_name, ok_cb, false)
   return "User With Phone "..matches[2].." has been added"
end

if matches[1]:lower() == "contactlist" and is_sudo(msg) then
 get_contact_list(get_contact_list_callback, {target = msg.from.id})
      return "I've sent contact list with both json and text format to your private"
end

if matches[1]:lower() == "dialoglist" and is_sudo(msg) then
    get_dialog_list(get_dialog_list_callback, {target = msg.from.id})
      return "I've sent a group dialog list with both json and text format to your private messages"
      end

if matches[1]:lower() == "pv" then
local text = "Message From @"..(msg.from.username or msg.from.first_name).."\n\nMessage : "..matches[3]
send_large_msg("user#id"..matches[2], text)
end
	to_id = msg.to.id
  -- Show the available plugins

    if matches[1] == 'addplug' and is_sudo(msg) then
  local text = matches[1]
  local b = 1
  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  local name = matches[2]
  local file = io.open("./plugins/"..name..".lua", "w")
  file:write(text)
  file:flush()
  file:close()
  return "Done !" 
end
  if matches[1] == "getplug" then
    local file = matches[2]
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_document(receiver, "./plugins/"..file..".lua", ok_cb, false)
    end
end
    if matches[1] == "remplug" and is_sudo(msg) then
text = io.popen("cd plugins && rm "..matches[2]..".lua")
return "plugin "..matches[2].." removed !"
end 
  if matches[1] == 'set' and is_sudo(msg) then
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local text = save_value(msg, name, value)
  return text..' >> '..matches[3]
  end  if matches[1] == 'del' and is_sudo(msg) then
  local name = string.sub(matches[2], 1, 50)
  local text = del_value(msg, name)
  return text
  end
    if not is_sudo(msg) then
    local text = get_value(msg, msg.text)
    reply_msg(msg.id, text, ok_cb, false)
  end
  end
end

return {
  patterns = {
    "^(addplug) +(.+) (.*)$",
    "^(remplug) (.*)$",
    "^(getplug) (.*)$" ,
	"^(s2a) +(.+)$",
    "^(f2a)$",
	"^(pv) (%d+) (.*)$",
    "^(addcontact) (.*) (.*) (.*)$",
    "^(contactlist)$",
    "^(dialoglist)$",
	"^(join) (.*)$",
	"^(set) ([^%s]+) (.+)$",
    "^(del) (.*)$",
    "(.*)",
"(.*)"
		},
  run = run
}
