local check= {}
check.__index= check
local memory= {}
local toCheck= function(c)
		if c:match("check") then
			local id= c:match("check%((.-)%)")
			for pos, _ in next, memory do
				if memory[pos].frontground== tonumber(id) then
					if not memory[pos].checked then
						ui.updateTextArea(tonumber(id), "<a href='event:check(".. memory[pos].frontground..")'>✔</a>",  memory[pos].target)
						memory[pos].checked= true
						_G[memory[pos].name].checked= true
					else
						ui.updateTextArea(tonumber(id), "<a href='event:check(".. memory[pos].frontground..")'> </a>",  memory[pos].target)
						memory[pos].checked= false
						_G[memory[pos].name].checked= false
					end
				end
			end
		end
end
function check:new(ids, name, x, y, target, static)
		local object= {
			x= x,
			y= y,
			background= ids[1],
			frontground= ids[2],
			checked= false,
			target= target,
			name= name
		}
		table.insert(memory, object)
		ui.addTextArea(object.background, "", target, x, y, 8, 8, nil, nil, 1, static)
		ui.addTextArea(object.frontground, "<a href='event:check("..object.frontground..")'> </a>", target, x - 4, y - 5, 20, 20, 0, 0, 1, static)
		return setmetatable(object, self)
end
function check:remove()
		ui.removeTextArea(self.background)
		ui.removeTextArea(self.frontground)
		self.checked= false
end
function check:add()
		ui.addTextArea(self.background, "", self.target, self.x, self.y, 8, 8, nil, nil, 1, self.static)
		ui.addTextArea(self.frontground, "<a href='event:check("..self.frontground..")'> </a>", self.target, self.x - 4, self.y - 5, 20, 20, 0, 0, 1, self.static)		
end
