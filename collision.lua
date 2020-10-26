--[[
    Mice collision script for TFM
    Coder: Jp_darkuss#4806
    Idea by: Fofinhoppp#0000 (Module Team member)

    Credits: Fofinhoppp#0000
]]
local collision= {}
do
    collision.debugging= false
    collision.collisions= {}
    collision.addPoint= function(id, x, y, player, callback, respawn)
        if respawn== nil then respawn= true end
        collision.collisions[id]= {
            callback= callback,
            respawn= respawn,
            player= player,
            x= x,
            y= y,
            type="point"
        }
        tfm.exec.addBonus(0, x, y, id, 0, collision.debugging, player)
    end
    collision.addArea= function(class, id, x, y, width, height, player, callback, respawn)
        local area= math.floor(width * height)
        local defaultX= x
        if respawn== nil then respawn= true end
        collision.collisions[class]= {
            x= x,
            y= y,
            id= id,
            width= width,
            height= height,
            callback= callback,
            player= player,
            respawn= respawn,
            points= {},
            type="area"
        }
        for i= 1, area do
            local len= #collision.collisions[class].points
            if (i - 1) % width== 0 then
                x= defaultX
                y= y + 25
            end
            tfm.exec.addBonus(0, x, y, id + (i - 1), 0, collision.debugging, player)
            x= x + 25
            collision.collisions[class].points[len + 1]= {
                id= id + (i - 1),
                x= x,
                y= y
            }
        end
        return id + (area - 1)
    end
    collision.removePoint= function(id, player)
        tfm.exec.removeBonus(id, player)
    end
    collision.removeArea= function(class, player)
        for pos in next, collision.collisions[class].points do
            tfm.exec.removeBonus(collision.collisions[class].points[pos].id, player)
        end
    end
    collision.getClass= function(id)
        for pos in next, collision.collisions do
            if collision.collisions[pos].type=="area" then
                for p in next, collision.collisions[pos].points do
                    if collision.collisions[pos].points[p].id== id then
                        return pos
                    end
                end
            end
        end
        return -1
    end
    collision.getPoint= function(class, id)
        for pos in next, collision.collisions[class].points do
            if collision.collisions[class].points[pos].id== id then
                return collision.collisions[class].points[pos]
            end
        end
    end
    collision.getAreaIds= function(class)
        local ids= {}
        for pos in next, collision.collisions[class].points do
            ids[#ids + 1]= collision.collisions[class].points[pos].id
        end
        return ids
    end
    collision.movePoint= function(id, x, y, add)
        local point= collision.collisions[id]
        if add== nil then add= false end
        collision.removePoint(id, point.player)
        if add then
            collision.addPoint(id, point.x + x, point.y + y, point.player, point.callback, point.respawn)
        else
            collision.addPoint(id, x, y, point.player, point.callback, point.respawn)
        end
    end
    collision.moveArea= function(class, x, y, add)
        local area= collision.collisions[class]
        if add== nil then add= false end
        collision.removeArea(class, area.player)
        if add then
            collision.addArea(class, area.id, area.x + x, area.y + y, area.width, area.height, area.player, area.callback, area.respawn)
        else
            collision.addArea(class, area.id, x, y, area.width, area.height, area.player, area.callback, area.respawn)
        end
    end
    collision.update= function(player, id)
        local class= collision.getClass(id)
        local _player= tfm.get.room.playerList[player]
        _player.name= player
        if class== -1 then
            local self= collision.collisions[id]
            self.callback(self, _player)
            if self.respawn then
                collision.addPoint(id, self.x, self.y, self.player, self.callback)
            end
        else
            local self= collision.collisions[class]
            local point= collision.getPoint(class, id)
            local data= {
                x= point.x,
                y= point.y
            }
            self.callback(data, _player)
            if self.respawn then
                collision.removeArea(class, self.player)
                collision.addArea(class, self.id, self.x, self.y, self.width, self.height, self.player, self.callback)
            end
        end
    end
end