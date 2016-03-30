do

function run(msg, matches)
send_contact(get_receiver(msg), "+989216358178", "#Aren", "", ok_cb, false)
end

return {
patterns = {
"^!abbasnum$",

},
run = run
}

end
