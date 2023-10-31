Player = Object:extend()
-- create player object
function Player:new(x, y, charNum)
    self.x = x
    self.y = y
    self.char = charNum
    self.w = 50
    self.h = 50

    self.vx = 0
    self.vy = 0
    self.speed = 1500

    self.r = 255
    self.g = 255
    self.b = 255
    self.a = 255

    self.img = p1_Sprite

    self.eye = {
        w = 5,
        h = 5,
        r = 255,
        g = 0,
        b = 0,
        a = 255,
        x = 0,
        y = 0,
    }


    self.health = 100
    self.stamina = 100
    self.mana = 100

    self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
    self.eye.y = self.y + (self.h * .5) - (.5 * self.eye.h)

end

function Player.update(self, dt)
    
    if self.char == "p1" then
        delta = p1_Move(p1)
        p1_Direction(p1)
    end
    if self.char == "p2" then
        delta = p2_Move(p2)
        p2_Direction(p2)
    end

    calculateVelocity(self, delta, dt)
end

function Player.draw(self)
    if self.char == "p1" then
        love.graphics.setColor(self.r, self.g, self.b, self.a)
        love.graphics.draw(self.img, self.x, self.y, 0, .15, .15)
    end

    if self.char == "p2" then
        love.graphics.setColor(self.r, self.g, self.b, self.a)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        love.graphics.setColor(self.eye.r, self.eye.g, self.eye.b, self.eye.a)
        love.graphics.rectangle("fill", self.eye.x, self.eye.y, self.eye.w, self.eye.h)
    end
end


function p1_Move(self)
    local p1_delta = {x = 0, y = 0}

    if love.keyboard.isDown("a") then
        p1_delta.x = -1
        p1_direction = "left"
    end

    if love.keyboard.isDown("w") then
        p1_delta.y = -1
        p1_direction = "up"
    end

    if love.keyboard.isDown("s") then
        p1_delta.y = 1
        p1_direction = "down"
    end

    if love.keyboard.isDown("d") then
        p1_delta.x = 1
        p1_direction = "right"
    end

    if love.keyboard.isDown("d") then
        if love.keyboard.isDown("w") then
            p1_direction = "up-right"
        end
    end
    
    if love.keyboard.isDown("d") then
        if love.keyboard.isDown("s") then
            p1_direction = "down-right"
        end
    end

    if love.keyboard.isDown("a") then
        if love.keyboard.isDown("w") then
            p1_direction = "up-left"
        end
    end
    
    if love.keyboard.isDown("a") then
        if love.keyboard.isDown("s") then
           p1_direction = "down-left"
        end
    end


    local joysticks = love.joystick.getJoysticks()
    if #joysticks > 0 then
        local xaxis = joysticks[1]:getAxis(1)
        local yaxis = joysticks[1]:getAxis(2)
        p1_delta.x = xaxis
        p1_delta.y = yaxis
    end

    return p1_delta
end

function p2_Move(self)
    local p2_delta = {x = 0, y = 0}

    if love.keyboard.isDown("kp4") then
        p2_delta.x = -1
        p2_direction = "left"
    end

    if love.keyboard.isDown("kp8") then
        p2_delta.y = -1
        p2_direction = "up"
    end

    if love.keyboard.isDown("kp5") then
        p2_delta.y = 1
        p2_direction = "down"
    end

    if love.keyboard.isDown("kp6") then
        p2_delta.x = 1
        p2_direction = "right"
    end

    if love.keyboard.isDown("kp6") then
        if love.keyboard.isDown("kp8") then
            p2_direction = "up-right"
        end
    end
    
    if love.keyboard.isDown("kp6") then
        if love.keyboard.isDown("kp5") then
            p2_direction = "down-right"
        end
    end

    if love.keyboard.isDown("kp4") then
        if love.keyboard.isDown("kp8") then
            p2_direction = "up-left"
        end
    end
    
    if love.keyboard.isDown("kp4") then
        if love.keyboard.isDown("kp5") then
            p2_direction = "down-left"
        end
    end

    local joysticks = love.joystick.getJoysticks()
    if #joysticks > 1 then
        local xaxis = joysticks[2]:getAxis(1)
        local yaxis = joysticks[2]:getAxis(2)
        p2_delta.x = xaxis
        p2_delta.y = yaxis
    end

    return p2_delta
end


function p1_Direction(self)
    
    if p1_direction == "right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .5) - (.5 * self.eye.h)
    end

    if p1_direction == "left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .5) - (.5 * self.eye.h)
    end

    if p1_direction == "up" then
        self.eye.x = self.x + (self.w * .5) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p1_direction == "down" then
        self.eye.x = self.x + (self.w * .5) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

    if p1_direction == "up-right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p1_direction == "down-right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

    if p1_direction == "up-left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p1_direction == "down-left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

end


function p2_Direction(self)
    
    if p2_direction == "right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .5) - (.5 * self.eye.h)
    end

    if p2_direction == "left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .5) - (.5 * self.eye.h)
    end

    if p2_direction == "up" then
        self.eye.x = self.x + (self.w * .5) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p2_direction == "down" then
        self.eye.x = self.x + (self.w * .5) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

    if p2_direction == "up-right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p2_direction == "down-right" then
        self.eye.x = self.x + (self.w * .75) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

    if p2_direction == "up-left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .25) - (.5 * self.eye.h)
    end

    if p2_direction == "down-left" then
        self.eye.x = self.x + (self.w * .25) - (.5 * self.eye.w)
        self.eye.y = self.y + (self.h * .75) - (.5 * self.eye.h)
    end

end

function calculateVelocity(self, delta, dt)
    self.vx = self.vx + delta.x * dt * self.speed
    self.vy = self.vy + delta.y * dt * self.speed

    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt

    self.vx = self.vx * math.pow(0.02, dt)
    self.vy = self.vy * math.pow(0.02, dt)
end