
local fwd_to = 1084736802
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
fwd_msg("chat#id"..tonumber(fwd_to), msg.id,ok_cb,false)
 elseif msg.text and msg.reply_id and tonumber(msg.to.id) == fwd_to then
    if not msg.text then
    return "You can only send Text message" 
      end
    get_message(msg.reply_id, callback_message, msg)
    end
	
local function run(msg)
  if not msg.text and msg.media then
    msg.text = '['..msg.media.type..']'
  end
  return msg
end
end
return {               
patterns = {
"(.*)",
	"%[(photo)%]",
	"%[(video)%]",
	"%[(audio)%]",
	"%[(contact)%]",
	"%[(webpage)%]",
  },
  run = run,
}
