function rozLta(msg, matches)
local receiver = get_receiver(msg)
local hash = 'typing:'..receiver
     if matches[1] == 'typing' and is_sudo(msg) then
--Enable Typing
     if matches[2] == 'on' then
    redis:del(hash)
   return 'Typing : <b>enabled</b>'
--Disable Typing
     elseif matches[2] == 'off' then
    redis:set(hash, true)
   return 'Typing : <b>disabled</b>'
--Typing Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Typing is <code>#enable</code>'
       else
   return 'Typing is <code>#disable</code>'
         end
      end
   end
      if not redis:get(hash) then
send_typing(get_receiver(msg), ok_cb, false)
   end
end
return { 
patterns = {
"^typing (.*)$",
"(.*)",
},
run = rozLta
}
