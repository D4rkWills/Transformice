--[[
    Id handler by Jp_darkuss#4806
    Created at: 21/11/20
    Last update: ??/??/??
]]
local id= {}
do
    id.maxId= 9999
    id.globalIds= {}
    id.new= function(reference)
        reference= reference or ""
        for pos= 0, id.maxId do
            if not id.globalIds[pos] or (id.get(reference)~= -1 and reference~="") then
                id.globalIds[pos]= {reference= reference}
                return pos
            end
        end
    end
    id.compare= function(_id, reference)
        local dataId
        for pos in next, id.globalIds do
            if id.globalIds[pos].reference== reference then
                dataId= pos
                break
            end
        end
        return dataId== _id
    end
    id.remove= function(reference)
        for pos= 0, id.maxId do
            if id.globalIds[pos].reference== reference then
                table.remove(id.globalIds, pos)
                return true
            end
        end
        return false
    end
    id.get= function(reference)
        for pos in next, id.globalIds do
            if id.globalIds[pos].reference== reference then
                return pos
            end
        end
        return -1
    end
end