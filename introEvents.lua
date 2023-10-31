
--////initialize variables used in title screen and intros

function load_Intro()
    INTRO_STATE = "engine"
end


--//// To be called by main draw function for all intro screens and menus.

function draw_Intro()
    if INTRO_STATE == "engine" then
        draw_Engine()
        if fade == 4 then
            engine = false
            fade = 1
            developer = true
        end
    end
    if developer == true then
        draw_Developer()
        if fade == 4 then
            developer = false
            fade = 1
            title = true
            timer = 360
        end
    end
    if title == true then
        draw_Title()
        if fade == 4 then
            title = false
            fade = 1
            subtitle = false
        end
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



