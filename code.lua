minetest.register_chatcommand("irc_sc", {
  description = "kick or ban people from IRC"
  privs = {server = true},
  params = "[task] [playername]",
  func = funktion(name)
  end,
  })
  
  
  
-- irc_sc/init.lua

minetest.register_chatcommand("irc_sc", {
    params = "<action> <playername>",
    description = "IRC Server Control",
    func = function(name, param)
        local args = param:split(" ")
        if #args < 2 then
            return false, "Usage: /irc_sc <action> <playername>"
        end
        local action = args[1]
        local playername = args[2]

        if action == "kick" then
            local irc_command = "irc_quote kick #Catlandia " .. playername
            minetest.chat_send_all("Executing IRC command: " .. irc_command)
        else
            return false, "Unknown action: " .. action
        end

        return true, "Command executed."
    end,
})