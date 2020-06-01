--[[
	Timer by Jp_darkuss#4806
	Create: 24/04/20
	Last update: ??/??/??
	Version: 1.0
]]--
local timers= {}
local timer= {
	["loop"]= function()
		for i, k in next, timers do
			if (timers[i].paused== false) then
				timers[i].count= timers[i].count + 500
				if (timers[i].or_times> 0 and timers[i].count>= timers[i].ms and timers[i].times> 0) then
					timers[i].count= 0
					timers[i].callback()
					timers[i].times= timers[i].times - 1
					timers[i].ms= timers[i].ms - timers[i].decrease
					if (timers[i].ms< 0) then
						timers[i]= 500
					end
					if (timers[i].times== 0) then
						if (timers[i].last=="pause") then
							timers[i].paused= true
						elseif (timers[i].last=="kill") then
							table.remove(timers, i)
						end
					end
				elseif (timers[i].count>= timers[i].ms) then
					timers[i].count= 0
					timers[i].callback()
				end
			end
		end
	end,
	["create"]= function(id, etiqueta, callback, ms, times, decrease, last, paused)
		if (last== nil) then
			last="pause"
		end
		if (paused== nil) then
			paused= false
		end
		if (type(decrease)~="number" or type(decrease)== nil) then
			decrease= 0
		end
		table.insert(timers, {
			["id"]= id,
			["callback"]= callback,
			["ms"]= ms,
			["last"]= last,
			["paused"]= paused,
			["count"]= 0,
			["or_times"]= times,
			["decrease"]= decrease,
			["etiqueta"]= etiqueta,
			["times"]= times
		})
	end,
	["kill"]= function(id)
		for pos in ipairs(timers) do
			if (timers[pos].id== id) then
				table.remove(timers, pos)
			end
		end
	end,
	["pause"]= function(id, pause)
		for pos, i in next, timers do
			if (timers[pos].id== id) then
				if (pause== true) then
					timers[pos].paused= true
				elseif (pause== false) then
					timers[pos].paused= false
				end
			end
		end
	end,
	["list"]= function()
		for i, k in next, timers do
			print("Timer "..string.format("%q", timers[i].id)..": "..timers[i].etiqueta.."n")
		end
	end
}
