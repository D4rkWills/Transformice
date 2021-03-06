--[[
        Timer by Jp_darkuss#4806
        Create: 24/04/20
        Last update: 25/04/20
        Version: 2.0

	**New**
	* Table get
	* fixed ms bug
	* decrease parameter changed
	* parameters to function
	* events added!
]]--
local timers= {}
local timer= {
        ["loop"]= function()
                for i in ipairs(timers) do
                        if (timers[i].paused== false) then
                                timers[i].count= timers[i].count + 500
                                if (timers[i].or_times> 0 and timers[i].count>= timers[i].ms and timers[i].times> 0) then
                                        timers[i].count= 0
                                        timers[i].callback(timers[i].arg1, timers[i].arg2, timers[i].arg3, timers[i].arg4, timers[i].arg5)
							if (type(eventTimerStart)=="function" and timers[i].times== timers[i].or_times) then
								eventTimerStart(timers[i].id)
							end
                                        timers[i].times= timers[i].times - 1
                                        timers[i].ms= timers[i].ms + (timers[i].change)
                                        if (timers[i].ms< 0) then
                                                timers[i].ms= 500
                                        end
                                        if (timers[i].times== 0) then
								  if (type(eventTimerFinish)=="function") then
									eventTimerFinish(timers[i].id)
								  end
                                                if (timers[i].last=="pause") then
                                                        timers[i].paused= true
										if (type(eventTimerPause)=="function") then
											eventTimerPause(timers[i].id, timers[i].or_times)
										end
                                                elseif (timers[i].last=="kill") then
										if (type(eventTimerKill)=="function") then
											eventTimerKill(timers[i].id, timers[i].or_times)
										end
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
        ["create"]= function(id, etiqueta, callback, ms, times, args, change, last, paused)
                if (last== nil) then
                        last="pause"
                end
                if (paused== nil) then
                        paused= false
                end
                if (type(change)~="number" or type(change)== nil) then
                        change= 0
                end
			if (type(args)~="table") then
				args= {}
			end
                table.insert(timers, {
                        ["id"]= id,
                        ["callback"]= callback,
                        ["ms"]= ms,
                        ["last"]= last,
                        ["paused"]= paused,
                        ["count"]= 0,
                        ["or_times"]= times,
                        ["change"]= change,
                        ["etiqueta"]= etiqueta,
                        ["times"]= times,
				  ["arg1"]= args[1],
				  ["arg2"]= args[2],
				  ["arg3"]= args[3],
				  ["arg4"]= args[4],
				  ["arg5"]= args[5]
                })
        end,
        ["kill"]= function(id)
                for pos in ipairs(timers) do
                        if (timers[pos].id== id) then
					if (type(eventTimerKill)=="function") then
						eventTimerKill(timers[pos].id, timers[pos].or_times - (timers[pos].times - 1))
					end
                                table.remove(timers, pos)
                        end
                end
        end,
        ["pause"]= function(id, pause)
                for pos, i in next, timers do
                        if (timers[pos].id== id) then
                                if (pause== true) then
                                        timers[pos].paused= true
							if (type(eventTimerPause)=="function") then
								eventTimerPause(timers[pos].id, timers[pos].or_times - (timers[pos].times - 1))
							end
                                elseif (pause== false) then
                                        timers[pos].paused= false
                                end
                        end
                end
        end,
        ["list"]= function()
                for i, k in next, timers do
                        print("Timer "..string.format("%q", timers[i].id)..": "..timers[i].etiqueta.."\n")
                end
        end,
		["get"]= {
			["timer"]= function(id)
				for pos, i in next, timers do
					if (timers[pos].id== id) then
						return pos
					end
				end
			end,
			["byTimer"]= function(id, what)
				if (what=="ms") then
					for pos, i in next, timers do
						if (timers[pos].id== id) then
							return timers[pos].ms
						end
					end
				elseif (what=="cicle") then
					for pos, i in next, timers do
						if (timers[pos].id== id) then
							return timers[pos].or_times - (timers[pos].times - 1)
						end
					end
				elseif (what=="times") then
					for pos, i in next, timers do
						if (timers[pos].id== id) then
							return timers[pos].or_times
						end
					end
				end
				
			end 
		}
}
