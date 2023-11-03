function load_Fonts()

    --used in introEvents
    devFont = love.graphics.newFont("fonts/typewriterFont.ttf", 24)
    engineFont = love.graphics.newFont("fonts/octopusFont.ttf", 24)
    titleFont = love.graphics.newFont("fonts/titleFont.ttf", 60)
    subtitleFont = love.graphics.newFont("fonts/titleFont.ttf", 30)

    --used in start.lua
    startMenuFont = love.graphics.newFont("fonts/typewriterFont.ttf", 50)

    --used for testing
    consoleFont = love.graphics.newFont("fonts/typewriterFont.ttf", 12)

end