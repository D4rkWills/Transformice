--[[
	Class Screen by Jp_darkuss#4806
	Manipulação de textArea
]]
local screen= {}
screen.__index= screen
function screen:new(id, text, player, x, y, width, height, background, border, opacity, static)
	object= {
		id= id,
		text= text,
		player= player,
		x= x or 0,
		y= y or 0,
		width= width or 100,
		height= height or 100,
		background= background or nil,
		border= border or nil,
		opacity= opacity or 1,
		static= static or false
	}
	object.update= function(player)
		player= player or object.player
		ui.addTextArea(object.id, object.text, player, object.x, object.y, object.width, object.height, object.background, object.border, object.opacity, object.static)
	end
	return setmetatable(object, self)
end
function screen:Render(player)
	self.update(player)
end
function screen:Remove(player)
	player= player or self.player
	ui.removeTextArea(self.id, player)
	self.update(player)
end
function screen:Move(x, y, player)
	self.x, self.y= x or self.x, y or self.y
	self.update(player)
end
function screen:Background(color, player)
	self.background= color
	self.update(player)
end
function screen:Border(color, player)
	self.border= color
	self.update(player)
end
function screen:Opacity(level, player)
	self.opacity= level
	self.update(player)
end
function screen:Text(text, player)
	self.text= text
	self.update(player)
end
function screen:Static(static, player)
	self.static= static
	self.update(player)
end
