--[[
		Radio Button
		Made by Jp_darkuss#4806 at 30/07, have fun! :)
]]
local radio= {}
do
		radio.memory= {}
		radio.color= function(c) if c then return " color='"..c.."'" else return "" end end
		radio.add= function(class, name, ids, player, x, y, selected, decoration, static)
			x, y= x or 0, y or 0
			decoration= decoration or {}
			selected= selected or false
			static= static or false
			if player then
				radio.memory[player][name]= {
					class= class,
					ids= ids,
					selected= selected,
					color= decoration.color
				}
				ui.addTextArea(ids[1], " ", player, x, y, 3, 3, decoration.background, decoration.border, 1, static)
				if selected then
					ui.addTextArea(ids[2], "<font size='10'"..radio.color(decoration.color)..">•</font>", player, x - 3, y - 7, 20, 20, 0, 0, 1, static)
				else
					ui.addTextArea(ids[2], "<a href='event:class("..class.."), name("..name..")'> </a>", player, x - 3, y - 7, 20, 20, 0, 0, 1, static)
				end
			else
				for _player, _ in next, tfm.get.room.playerList do
					radio.memory[_player][name]= {
						class= class,
						ids= ids,
						selected= selected,
						color= decoration.color
					}
					ui.addTextArea(ids[1], " ", _player, x, y, 3, 3, decoration.background, decoration.border, 1, static)
					if selected then
						ui.addTextArea(ids[2], "<font size='10'"..radio.color(decoration.color)..">•</font>", _player, x - 3, y - 7, 20, 20, 0, 0, 1, static)
					else
						ui.addTextArea(ids[2], "<a href='event:class("..class.."), name("..name..")'> </a>", _player, x - 3, y - 7, 20, 20, 0, 0, 1, static)
					end
				end
			end			
		end
		radio.remove= function(class, player)
			for pos, _ in next, radio.memory[player] do
				if radio.memory[player][pos].class== class then
					ui.removeTextArea(radio.memory[player][pos].ids[1], player)
					ui.removeTextArea(radio.memory[player][pos].ids[2], player)
				end
			end
		end
		radio.select= function(player, callback)
			if callback:match("class") and callback:match("name") then
				local class= callback:match("class%((.-)%)")
				local name= callback:match("name%((.-)%)")
				for pos, _ in next, radio.memory[player] do
					if radio.memory[player][pos].class== class then
						if pos== name then
							ui.updateTextArea(radio.memory[player][pos].ids[2], "<font size='10'"..radio.color(radio.memory[player][pos].color)..">•</font>", player)
							radio.memory[player][pos].selected= true
						else
							ui.updateTextArea(radio.memory[player][pos].ids[2], "<a href='event:class("..class.."), name("..pos..")'> </a>", player)
							radio.memory[player][pos].selected= false
						end
					end
				end
			end
		end
		radio.isSelected= function(class, player)
			for pos, _ in next, radio.memory[player] do
				if radio.memory[player][pos].class== class and radio.memory[player][pos].selected then
					return pos
				end
			end
		end
		radio.new= function(player)
			radio.memory[player]= {}
		end
		radio.init= function()
			for player, _ in next, tfm.get.room.playerList do
				radio.memory[player]= {}
			end
		end
end
