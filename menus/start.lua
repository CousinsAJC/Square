function start_Load()
    cursor = {
        x = 300,
        y = 60
    }
    MENU_STATE = "new-load"
    change_Menu = false
end


function start_Update(dt)
    if MENU_STATE == "player-count" and change_Menu == true then
        cursor.x = 400
        cursor.y = 240
        change_Menu = false
    end

    if MENU_STATE == "load" and change_Menu == true then
        --load a game state
        change_Menu = false
    end

    if MENU_STATE == "p1-customize" and change_Menu == true then
        --setup 1 player
        change_Menu = false
        PLAYER_COUNT = 1
    end

    if MENU_STATE == "p2-customize" and change_Menu == true then
        --setup 2 players
        change_Menu = false
    end

    
end



function start_Draw()
    if MENU_STATE == "new-load" then
        love.graphics.print("New Game", 20, 20)
        love.graphics.print("Load Game", 20, 200)
        love.graphics.setFont(startMenuFont)
        love.graphics.print("^", cursor.x, cursor.y, 4.7)
    end
    
    if MENU_STATE == "player-count" then
        love.graphics.print("How many players?", 20, 20)
        love.graphics.print("One Player", 20, 200)
        love.graphics.print("Two Players", 20, 400)
        love.graphics.print("^", cursor.x, cursor.y, 4.7)
    end
    if MENU_STATE == "load" then
        --load a gamestate options
    end

    if MENU_STATE == "p1-customize" then
        love.graphics.print("Customize your character", 20, 20)
        love.graphics.draw(p1_Sprite, 100, 100, 0, .5, .5)
        love.graphics.print("Press space to continue", 20, 500)
    end
    if MENU_STATE == "p2-customize" then
        -- print two player options
    end
end

