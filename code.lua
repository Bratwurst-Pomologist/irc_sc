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



minetest.register_chatcommand("del_snippet", {
    params = "<snippet_name>",
    description = "Löscht ein Snippet",
    privs = {server = true, worldedit = true},
    func = function(name, param)
        if param == "" then
            return false, "Bitte gib den Namen des Snippets an."
        end
        local snippet_name = param
        minetest.chat_send_player(name, "Versuche, das Snippet '" .. snippet_name .. "' zu löschen...")
        local success, err = pcall(function()
            snippets.unregister_snippet(snippet_name)
        end)
        if success then
            return true, "Snippet '" .. snippet_name .. "' wurde erfolgreich gelöscht."
        else
            return false, "Fehler beim Löschen des Snippets: " .. err
        end
    end,
})

