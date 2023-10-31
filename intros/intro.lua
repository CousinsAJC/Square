--////initialize variables used in intros

function load_Intro()
    require "intros/developer"
    require "intros/engine"
    require "intros/title"
    require "transitions/fade"
    load_Engine()
    load_Developer()
    load_Title()
    load_Fade()
    INTRO_STATE = "engine"
end


function draw_Intro()
    if INTRO_STATE == "engine" then
        draw_Engine()
        if FADE_STATE == "fade-out-done" then
            INTRO_STATE = "developer"
            FADE_STATE = "no-fade"
        end
    end
    if INTRO_STATE == "developer" then
        draw_Developer()
        if FADE_STATE == "fade-out-done" then
            INTRO_STATE = "title"
            FADE_STATE = "no-fade"
            timer = 360
        end
    end
    if INTRO_STATE == "title" then
        draw_Title()
    end
end


function drawCenteredText(x, y, w, h, text, font, offset)
    --centers text within a frame/the screen unless given an offset.  Offset of 0 is true center.
	local textWidth = font:getWidth(text)
	local textHeight = font:getHeight()
    love.graphics.setFont(font)
	love.graphics.print(text, x+w/2, y+h/2 + offset, 0, 1, 1, textWidth/2, textHeight/2)
end


function press_Space(font)
    local text = "Press space to continue"
    local textWidth = font:getWidth(text)
    local textHeight = font:getHeight()
    love.graphics.setFont(font)
    local position_y = WINDOW_HEIGHT/2 + (WINDOW_HEIGHT/4)
    love.graphics.print(text, WINDOW_WIDTH/2, position_y, 0, 1, 1, textWidth/2, textHeight/2)
end