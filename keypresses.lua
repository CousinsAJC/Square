
function love.keypressed(key, scancode, isrepeat)

    --//// GAME_STATE "intro" keypresses
    if GAME_STATE == "intro" then 
        if INTRO_STATE == "title" then
            if FADE_STATE == "wait-time-done" then
                if key == "space" then
                    GAME_STATE = "menu"
                end
            end
        end
    end


    --//// GAME_STATE "menu" keypresses
    if GAME_STATE == "menu" then
        if MENU_STATE == "new-load" then
            if key == "up" or key == "down" then
                if cursor.y == 60 then
                    cursor.y = 240
                    love.audio.play(menuClick)
                elseif cursor.y == 240 then
                    cursor.y = 60
                    love.audio.play(menuClick)
                end
            end
            if key == "return" then
                if cursor.y == 60 then
                    change_Menu = true
                    MENU_STATE = "player-count"
                    love.audio.play(menuClick)
                elseif cursor.y == 240 then
                    change_Menu = true
                    MENU_STATE = "load"
                    love.audio.play(menuClick)
                end
            end
        end
        if MENU_STATE == "player-count" then
            if key == "up" or key == "down" then
                if cursor.y == 240 then
                    cursor.y = 440
                    love.audio.play(menuClick)
                elseif cursor.y == 440 then
                    cursor.y = 240
                    love.audio.play(menuClick)
                end
            end
            if key == "return" then
                if cursor.y == 240 then
                    change_Menu = true
                    MENU_STATE = "p1-customize"
                    love.audio.play(menuClick)
                elseif cursor.y == 440 then
                    change_Menu = true
                    MENU_STATE = "p2-customize"
                    love.audio.play(menuClick)
                end
            end
        end
        if MENU_STATE == "p1-customize" then
            if key == "space" then
                GAME_STATE = "gameplay"
            end
        end
        if MENU_STATE == "pause" then
            if key == "left" or key == "right" then
                if cursor.x == 230 then
                    cursor.x = 630
                    love.audio.play(menuClick)
                elseif cursor.x == 630 then
                    cursor.x = 230
                    love.audio.play(menuClick)
                end
            end
            if key == "return" then
                if cursor.x == 230 then
                    love.audio.play(menuClick)
                    GAME_STATE = "gameplay"
                elseif cursor.x == 630 then
                    love.event.quit()
                end
            end
        end
    end


    --//// GAME_STATE "gameplay" keypresses
    if GAME_STATE == "gameplay" then
        if key == "escape" then
            GAME_STATE = "menu"
            MENU_STATE = "pause"
            cursor.x = 230
            cursor.y = 330
            change_Menu = true
        end
    end
end
