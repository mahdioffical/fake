do   
-- send to channel telegram @kosklk
local fwd_to = 1095976774
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
		  if msg.to.type == "channel" then
fwd_msg("channel#id"..tonumber(fwd_to), msg.id,ok_cb,false)
 elseif msg.text and msg.reply_id and tonumber(msg.to.id) == fwd_to then
   if not msg.text then
    return "نمیتونم این کارو انجام بدم!!!!!!"
      end
    get_message(msg.reply_id, callback_message, msg)
    end
end

return {               
patterns = {
"(.*)",
  },
  run = run,
}
end