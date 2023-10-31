function load_Developer()
    devText = "A game by Sweetbriar Studios"
end

function draw_Developer()
    love.graphics.setColor(255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, devText, devFont, 0)
    complete_Fade()
end