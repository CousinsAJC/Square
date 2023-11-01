Enemy = Object:extend()

function Enemy:new(x, y)
    self.x = x
    self.y = y
    self.radius = 25,

    self.vx = 0
    self.vy = 0
    self.speed = 1500

    self.r = 255
    self.g = 0
    self.b = 0
    self.a = 255

    self.eye = {
        x = 5,
        y = 5,
        radius = 5,
        r = 255,
        g = 0,
        b = 0,
        a = 255,
        x = 0,
        y = 0,
    }

    self.health = 100

    --enemy direction table // looking at numpad, 
    --5 being idle, then 8 directions
    self.ED = {
        1,2,3,4,5,6,7,8,9
    }

    self.delta = {
        x = 0
        y = 0
    }
end


function enemy_Update(dt)
    enemyAI()
    enemyInput()
end

function enemy_Draw()

end


function enemyAI()
    --determine what to do
end

function idle()
    self.speed = 500
end

function onAlert()

end

function onChase()

end

function lostInterest()

end

    

function enemyInput()

    if love.keyboard.isDown("left") then
        self.delta.x = -1
        ED = 4
        self.eye.x = self.x - self.radius + (self.eye.radius)
        self.eye.y = self.y
    end

    if love.keyboard.isDown("up") then
        self.delta.y = -1
        ED = 8
        self.eye.x = self.x
        self.eye.y = self.y - self.radius + (self.eye.radius)
    end

    if love.keyboard.isDown("down") then
        self.delta.y = 1
        ED = 2
        self.eye.x = self.x
        self.eye.y = self.y + self.radius - (self.eye.radius)
    end

    if love.keyboard.isDown("right") then
        self.delta.x = 1
        ED = 6
        self.eye.x = self.x + self.radius - (self.eye.radius)
        self.eye.y = self.y
    end

    if love.keyboard.isDown("right") then
        if love.keyboard.isDown("up") then
            ED = 9
            self.eye.x = self.x + self.radius - (2 * self.eye.radius)
            self.eye.y = self.y - self.radius + (2 * self.eye.radius)
        end
    end
    
    if love.keyboard.isDown("right") then
        if love.keyboard.isDown("down") then
            ED = 3
            self.eye.x = self.x + self.radius - (2 * self.eye.radius)
            self.eye.y = self.y + self.radius - (2 * self.eye.radius)
        end
    end

    if love.keyboard.isDown("left") then
        if love.keyboard.isDown("up") then
            ED = 7
            self.eye.x = self.x - self.radius + (2 * self.eye.radius)
            self.eye.y = self.y - self.radius + (2 * self.eye.radius)
        end
    end
    
    if love.keyboard.isDown("left") then
        if love.keyboard.isDown("down") then
            ED = 1
            self.eye.x = self.x - self.radius + (2 * self.eye.radius)
            self.eye.y = self.y + self.radius - (2 * self.eye.radius)
        end
    end

end
    
function calculateEnemyVelocity(self, delta, dt)
    self.vx = self.vx + delta.x * dt * self.speed
    self.vy = self.vy + delta.y * dt * self.speed

    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt

    self.vx = self.vx * math.pow(0.02, dt)
    self.vy = self.vy * math.pow(0.02, dt)
end