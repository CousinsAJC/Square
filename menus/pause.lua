function load_Pause()
    pause_text = "Game Paused"
end

function update_Pause()

end

function draw_Pause()
    love.graphics.setColor(255, 255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, pause_text, startMenuFont, -50)
    love.graphics.print("^", cursor.x, cursor.y, 4.7)
end