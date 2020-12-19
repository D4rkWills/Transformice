--[[
    Timer by Jp_darkuss#4806
    Create: 24/04/20
    Last update: 19/12/20
    Version: 2.1

	**New**
    * Removed all unecessary things (timer.get, parameters to timer, args, timer.list, eventTimerFinish)
    * Renamed functions (timer.remove, timer.new)
    * Renamed events (eventTimerRemove)
    * Amount of lines decreased
    * Parameter last is a boolean value now

    - disclaimer: it's recommended to do not use the previous versions
]]--
local timer= {}
do
    timer.timers= {}
    timer.loop= function()
        for pos in ipairs(timer.timers) do
            if not timer.timers[pos].paused then
                timer.timers[pos]._ms= timer.timers[pos]._ms + 500
                if timer.timers[pos]._ms>= timer.timers[pos].ms then
                    timer.timers[pos].callback()
                    timer.timers[pos]._ms= 0
                    if timer.timers[pos]._times~= 0 then
                        timer.timers[pos].times= timer.timers[pos].times - 1
                        if timer.timers[pos].times<= 0 then
                            local id= timer.timers[pos].id
                            if timer.timers[pos].last then
                                timer.remove(id)
                            else
                                timer.pause(id, true)
                            end
                        end
                    end
                end
            end
        end
    end
    timer.new= function(id, ms, callback, times, paused, last)
        times= times or 0
        paused= paused or false
        last= last or false
        timer.timers[#timer.timers + 1]= {
            id= id,
            ms= ms,
            callback= callback,
            times= times,
            paused= paused,
            last= last,
            _ms= 0,
            _times= times
        }
    end
    timer.remove= function(id)
        for pos in ipairs(timer.timers) do
            if timer.timers[pos].id== id then
                table.remove(timer.timers, pos)
                if type(eventTimerRemove)=="function" then eventTimerRemove(id) end
                break
            end
        end
    end
    timer.pause= function(id, paused, reset)
        reset= reset or false
        for pos in next, timer.timers do
            if timer.timers[pos].id== id then
                if reset then
                    timer.timers[pos]._ms= 0
                    timer.timers[pos].times=timer.timers[pos]._times
                end
                timer.timers[pos].paused= paused
                if paused and type(eventTimerPause)=="function" then eventTimerPause(id) end
                break
            end
        end
    end
end
