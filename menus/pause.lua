function load_Pause()
    pause_text = "Game Paused"
    cont_exit = "Continue?          Exit?"
    
end

function update_Pause()

end

function draw_Pause()
    love.graphics.setColor(255, 255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, pause_text, startMenuFont, -50)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, cont_exit, startMenuFont, 50)
    love.graphics.print("^", cursor.x, cursor.y, 4.7)
end