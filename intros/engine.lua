function load_Engine()
    engineText = "Made with Love2D"
end


function draw_Engine()
    love.graphics.setColor(255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, engineText, engineFont, 0)
    complete_Fade()
end