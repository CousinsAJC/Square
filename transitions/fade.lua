function load_Fade()
    fade_R = 0
    fade_G = 0
    fade_B = 0
    fade_A = 1
    FADE_STATE = "no-fade"
    timer = 180
end


function fade_In()
    love.graphics.setColor(fade_R, fade_G, fade_B, fade_A)
    love.graphics.rectangle("fill", 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)
    if fade_A > 0 then
        fade_A = fade_A - 0.005
    elseif fade_A <= 0 then
        fade_A = 0
        FADE_STATE = "fade-in-done"
    end
end

function fade_Out()
    love.graphics.setColor(fade_R, fade_G, fade_B, fade_A)
    love.graphics.rectangle("fill", 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)
    if fade_A < 1 then
        fade_A = fade_A + 0.005
    elseif fade_A >= 1 then
        fade_A = 1
        FADE_STATE = "fade-out-done"
    end
end




function complete_Fade()
    if FADE_STATE == "no-fade" then
        fade_In()
    end

    if FADE_STATE == "fade-in-done" then
        timer = wait_Timer(timer)
    end

    if FADE_STATE == "wait-time-done" then
        fade_Out()
    end
end



function title_Fade()
    if FADE_STATE == "no-fade" then
        fade_In()
        timer = 360
    end
    if FADE_STATE == "fade-in-done" then
        timer = wait_Timer(timer)
    end
end

function wait_Timer(duration)
    duration = duration -1
    if duration <= 0 then
        FADE_STATE = "wait-time-done"
    end
    return duration
end