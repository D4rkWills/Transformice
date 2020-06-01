local adm="" --nome do administrador
local voting= false --se está havendo votação
local candidatos= {} --os candidatos
local eixoX, eixoY= 0, 1
local votou= {}
local verificar= function(player)
	for _, i in next, votou do
		if (player== i) then
			return true
		end
	end
	return false
end
local x= function()
	if (eixoX> 6) then
		eixoX= 1
		eixoY= eixoY + 1
	end
	return eixoX * 130
end
local y= function()
	return eixoY * 70
end
eventChatCommand= function(player, c)
	local command= {}
	for i in c:gmatch("%S+") do
		table.insert(command, i)
	end
	if (command[1]=="add" and not voting and player== adm) then
		table.insert(candidatos, {
			nome= command[2],
			votos= 0,
			numero= tonumber(command[3])
		})
		eixoX= eixoX + 1
		ui.addTextArea(candidatos[#candidatos].numero, "<font size='12' color='#66FF66'><br/><p align='center'><a href='event:"..candidatos[#candidatos].numero.."'>"..candidatos[#candidatos].nome.."</a></p></font>", nil, x() - 100, y(), 120, 50, nil, nil, 0.8, true)
	elseif (command[1]=="remove" and not voting and player== adm) then
		for pos, _ in ipairs(candidatos) do
			if (command[2]== candidatos[pos].nome) then
				ui.updateTextArea(candidatos[pos].numero, "<font size='12' color='#FF6666'><br/><p align='center'>Removido!</p></font>", nil)
				table.remove(candidatos, pos)
			end
		end
	elseif (c=="reset" and player== adm) then
		for pos, _ in ipairs(candidatos) do
			ui.removeTextArea(candidatos[pos].numero)
		end
		ui.updateTextArea(0, "<font size='15' color='#66FF66'><p align='center'>Candidatos</p></font>", nil)
		candidatos= {}
		votou= {}
		eixoX= 0
		eixoY= 1
	elseif (c=="start" and not voting and player== adm and #candidatos>= 2) then
		voting= true
		ui.updateTextArea(0, "<font size='15' color='#66FF66'><p align='center'>Votem!!</p></font>", nil)
	elseif (c=="apurar" and voting and player== adm and #votou>= 1) then
		local index= {index= 0, votos= 0}
		for pos, _ in next, candidatos do
			if (candidatos[pos].votos> index.votos) then
				index.index= pos
				index.votos= candidatos[pos].votos
			end
		end
		ui.updateTextArea(0, "<font size='15' color='#66FF66'><p align='center'>"..candidatos[index.index].nome.."!</p></font>", nil)
		for i= 1, 30 do
			tfm.exec.displayParticle(math.random(0, 2), math.random(0, 800), math.random(0, 800), 2, 2, 2, 2, nil)
			tfm.exec.displayParticle(math.random(0, 2), math.random(0, 800), math.random(0, 800), 2, 2, 2, 2, nil)
		end
		voting= false
	end
end
eventTextAreaCallback= function(_, player, callback)
	if (voting and not verificar(player)) then
		table.insert(votou, player)
		for pos, _ in next, candidatos do
			if (candidatos[pos].numero== tonumber(callback)) then
				ui.updateTextArea(tonumber(callback), "<font size='12' color='#66FF66'><br/><p align='center'>Votado!</p></font>", player)
				candidatos[pos].votos= candidatos[pos].votos + 1
			end
		end
	end
end
eventNewPlayer= function(player)
	ui.addTextArea(0, "<font size='15' color='#66FF66'><p align='center'>Candidatos</p></font>", player, 300, 30, 200, nil, nil, nil, 0.6, true)
end
do
	ui.addTextArea(0, "<font size='15' color='#66FF66'><p align='center'>Candidatos</p></font>", nil, 300, 30, 200, nil, nil, nil, 0.6, true)
	system.disableChatCommandDisplay()
end
