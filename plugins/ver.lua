do

function run(msg, matches)
  return 'selfbot v.seed'.. VERSION .. [[ 
 
  it's self bot for @Iiborn 
  😎😎😎😎
  https://github.com/abbasgh12345/mebot
  
  All rights reserved.
  __________________]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^!ver$"
  }, 
  run = run 
}

end
