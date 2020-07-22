local _, adm= pcall(nil)
adm= adm:match(".-#%d+")
local player= adm
local players= {}
local maps= {
		madeira='<C><P /><Z><S><S L="802" H="38" X="402" Y="384" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="808" Y="408" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="49" H="275" X="407" Y="227" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="351" X="322" /><F Y="86" X="407" /><T Y="89" X="408" /></D><O /></Z></C>',
		chocolate='<C><P /><Z><S><S L="802" H="38" X="402" Y="384" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="808" Y="408" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="53" H="274" X="414" Y="228" T="4" P="0,0,20,0.2,0,0,0,0" /></S><D><DS Y="351" X="322" /><F Y="86" X="407" /><T Y="89" X="408" /></D><O /></Z></C>',
		grama='<C><P /><Z><S><S L="802" H="38" X="402" Y="384" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="808" Y="408" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="46" H="273" X="408" Y="227" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="351" X="322" /><F Y="86" X="407" /><T Y="89" X="408" /></D><O /></Z></C>',
		areia='<C><P /><Z><S><S L="802" H="38" X="402" Y="384" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="808" Y="408" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="52" H="273" X="411" Y="227" T="7" P="0,0,0.1,0.2,0,0,0,0" /></S><D><DS Y="351" X="322" /><F Y="86" X="407" /><T Y="89" X="408" /></D><O /></Z></C>',
		gelo='<C><P /><Z><S><S L="802" H="38" X="402" Y="384" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="808" Y="408" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="97" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="120" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="140" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="161" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="184" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="207" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="228" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="249" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="270" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="292" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="409" Y="313" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" X="409" H="10" Y="336" T="1" P="0,0,0,0.2,0,0,0,0" /></S><D><DS Y="351" X="322" /><F Y="86" X="407" /><T Y="89" X="408" /></D><O /></Z></C>'
}
local screen= function(player)
		ui.addTextArea(2, "<p align='center'><b><font size='12'>Selecione o mapa que quer usar</font></b></p><br/></br><p>-- <a href='event:set(madeira)'>Madeira</a></p><p>-- <a href='event:set(grama)'>Grama</a></p><p>-- <a href='event:set(gelo)'>Gelo</a></p><p>-- <a href='event:set(chocolate)'>Chocolate</a></p><p>-- <a href='event:set(areia)'>Areia</a></p><br/><p align='center'><b><a href='event:side(left)'>Esquerda</a> - <a href='event:side(right)'>Direita</a></b></p><br/><p>Tipo de WJ: <a href='event:wj(CLL)'>CLL</a> - <a href='event:wj(LCL)'>LCL</a></p>", player, 300, 150, 200, 180)
end
local can= function(player)
		for _, data in next, {87, 38, 65, 39, 37, 68} do
			system.bindKeyboard(player, data, false, true)
		end
end
eventTextAreaCallback= function(_, _player, callback)
		if callback=="player" then
			ui.addPopup(0, 2, "<p align='center'>Digite o nome do player</p>", adm, 300, 200, nil)
		elseif callback:match("set") then
			local map= callback:match("set%((.-)%)")
			players[_player].mapName= map
			tfm.exec.newGame(maps[map], players[_player].left)
			ui.removeTextArea(2, _player)
			players[_player].count= 0
			players[_player].sequence=""
		elseif callback:match("side") then
			local side= callback:match("side%((.-)%)")
			players[_player].left= (side=="left")
		elseif callback=="map" then
			if player== _player then
				screen(_player)
			end
		elseif callback:match("wj") then
			players[_player].wj= callback:match("wj%((.-)%)")
		elseif callback=="close" then
			ui.removeTextArea(4, _player)
		end
end
eventPopupAnswer= function(_, _, answer)
		player= answer
		ui.updateTextArea(1, "<font size='12'>Current player: <b>"..player.."</b></font>", nil)
end
eventNewPlayer= function(player)
		players[player]= {
			count= 0,
			sequence="",
			mapName="",
			left= true,
			wj="CLL"
		}
		can(player)
		ui.addTextArea(3, "<b><font color='#66FF66'><a href='event:map'>Mapa</a></font></a>", player, 20, 370, nil, nil, nil, nil, 0.9, true)
		ui.addTextArea(1, "<font size='12'>Current player: <b>"..player.."</b></font>", player, 280, 30)
		tfm.exec.respawnPlayer(player)
end
eventKeyboard= function(player, code)
		if code== 37 or code== 68 then
			players[player].sequence= players[player].sequence..((players[player].sequence=="") and "D" or " - D")
		elseif code== 65 or code== 39 then
			players[player].sequence= players[player].sequence..((players[player].sequence=="") and "E" or " - E")
		elseif code== 87 or code== 38 then
			players[player].sequence= players[player].sequence..((players[player].sequence=="") and "C" or " - C")
		end
end
eventLoop= function()
		for _player, _ in next, players do
			if _player== player then
				players[_player].count= players[_player].count + 500
			end
		end
end
eventPlayerWon= function(_player)
		if _player== player then
			local time= players[_player].count / 1000
			players[_player].count= 0
			ui.addTextArea(4, "<p align='center'><b>Performance de ".._player.."</b></p><br/><p>Tipo de mapa: "..players[_player].mapName.."</p><br/><p>Tempo de escalada: "..time.."s</p><br/><p>Padrão de escalada: "..players[_player].sequence.."</p><br/><p>Tipo de wj usado: "..players[_player].wj.."</p><br/><p align='center'><font color='#66FF66'><a href='event:close'>OK</a></font></p>", nil, 250, 100, 250, 250)
			players[_player].sequence=""
			tfm.exec.respawnPlayer(_player)
		end
end
do
		ui.addTextArea(3, "<b><font color='#66FF66'><a href='event:map'>Mapa</a></font></a>", nil, 20, 370, nil, nil, nil, nil, 0.9, true)
		ui.addTextArea(0, "<b><font color='#66FF66'><a href='event:player'>Set Player</a></font></a>", adm, 80, 370, nil, nil, nil, nil, 0.9, true)
		ui.addTextArea(1, "<font size='12'>Current player: <b>"..player.."</b></font>", nil, 280, 30)
		for player, _ in next, tfm.get.room.playerList do
			players[player]= {
				count= 0,
				sequence="",
				mapName="",
				left= true,
				wj="CLL"
			}
			can(player)
		end
		screen(player)
		tfm.exec.disableAutoShaman()
		tfm.exec.disableAutoNewGame()		
end
