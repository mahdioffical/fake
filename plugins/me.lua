do

local function run(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./plugins/sticker/sudo.webp", ok_cb, false)
      return "@Iiborn"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./plugins/sticker/admin.webp", ok_cb, false)
      return "You are My ADMIN"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./plugins/sticker/owner.webp", ok_cb, false)
      return "You are Group Owner"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./plugins/sticker/mod.webp", ok_cb, false)
      return "You are Group Moderator"
    else
    send_document(get_receiver(msg), "./plugins/sticker/member.webp", ok_cb, false)
      return "You are Group Member"
    end
  end
end

return {
  patterns = {
    "^[!/]([Mm]e)$",
    "^([Mm]e)$"
    },
  run = run
}
end
