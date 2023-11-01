function load_Pause()
    pause_text = "Game Paused"
    cont_exit = "Continue?          Exit?"
    
end

function update_Pause()
    if MENU_STATE == "pause" then
        change_Menu = false
    end
end

function draw_Pause()
    love.graphics.setColor(255, 255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, pause_text, startMenuFont, -50)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, cont_exit, startMenuFont, 50)
    love.graphics.print("^", cursor.x, cursor.y, 3.1)
end