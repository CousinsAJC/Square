
--window dimensions for calculations of screen placement

WINDOW_WIDTH, WINDOW_HEIGHT = 800, 600

--game state used almost like a scene management for overall game engine
GAME_STATE = "menu"
PLAYER_COUNT = 0

function love.load()
    


    --load all files needed for the game
    camera = require "camera"
    Object = require "classic"
    require "player"
    require "intros/intro"
    require "menus/start"
    require "fonts/fonts"
    require "keypresses"
    require "sfx/audio"
    require "sprites/sprites"
    require "menus/pause"
    require "maps/testmap"


    --load all functions needed to initialize variables
    load_Fonts()
    load_Sounds()
    load_Sprites()
    start_Load()
    load_Pause()


    cam = camera()
    p1 = Player(50, 50, "p1")
    p2 = Player(50, 250, "p2")

    --e1 = Enemy(300, 300)

    -- perform opening screens into start menu
    load_Intro()
    testmap_Load()


    --Can start new game, load a game or go into options
    --give option for two players somewhere in here

    --start the game - probably initial cutscene
    --actual gameplay.

end


function love.update(dt)
    if GAME_STATE == "intro" then

    end

    if GAME_STATE == "menu" then
        start_Update(dt)
        if change_Menu == true and MENU_STATE == "pause" then
            update_Pause()
        end        
    end

    if GAME_STATE == "gameplay" then
        testmap_Update()
        p1.update(p1, dt)
        p2.update(p2, dt)
        --e1.update(dt)
    end
    cam:lookAt(p1.x, p1.y)

end


function love.draw()

    if GAME_STATE == "intro" then
        draw_Intro()
    end

    if GAME_STATE == "menu" then
        if MENU_STATE == "pause" then
            draw_Pause()
        end
        if MENU_STATE == "new-load" or MENU_STATE == "player-count" or MENU_STATE == "p1-customize" or MENU_STATE == "p2-customize" or MENU_STATE == "load" then
            start_Draw()
        end
    end
    cam:attach()
        if GAME_STATE == "gameplay" then
            testmap_Draw()
            p1.draw(p1)
            p2.draw(p2)
        end
    cam:detach()

end