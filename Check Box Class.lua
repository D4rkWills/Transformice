local memory= {}
local new= function(player)
		memory[player]= {}
end
local check= function(player, callback)
		if callback:match("check") then
			local name= callback:match("check%((.-)%)")
			if not memory[player][name].checked then
				ui.updateTextArea(memory[player][name].ids[2], "<a href='event:check("..name..")'><font size='12'>✔</font></a>", player)
				memory[player][name].checked= true
			else
				ui.updateTextArea(memory[player][name].ids[2], "<a href='event:check("..name..")'>  <br/>  </a>", player)
				memory[player][name].checked= false
			end
		end
end
local init= function()
		for player, _ in next, tfm.get.room.playerList do
			memory[player]= {}
		end
end
local checkBox= {
		add= function(name, ids, player, x, y, checked, static)
			local _Checked= function()
				return (checked== true) and "<a href='event:check("..name..")'><font size='12'>✔</font></a>" or "<a href='event:check("..name..")'><font size='12'>  <br/>  </font></a>"
			end
			x= x or 0
			y= y or 0
			checked= checked or false
			static= static or false
			memory[player][name]= {
				ids= ids,
				checked= checked
			}
			ui.addTextArea(ids[1], " ", player, x, y, 8, 8, nil, nil, 1, static)
			ui.addTextArea(ids[2], _Checked(), player, x - 5, y - 6, 20, 20, 0, 0, 1, static)
		end,
		remove= function(name, player)
			ui.removeTextArea(memory[player][name].ids[1], player)
			ui.removeTextArea(memory[player][name].ids[2], player)
		end
}
local isChecked= function(name, player)
		return memory[player][name].checked
end
