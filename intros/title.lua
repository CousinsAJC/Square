function load_Title()
    titleText = "Don't be a Square"
    subtitleText = "The Shapely Fellows and a Fallen King"
    subtitleAlpha = 0
end


function draw_Title()
    love.graphics.setColor(255, 255, 255)
    drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, titleText, titleFont, -27)
    if timer <= 180 then
        love.graphics.setColor(255, 255, 255, subtitleAlpha)
        drawCenteredText(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, subtitleText, subtitleFont, 27)
        if subtitleAlpha < 1 then
            subtitleAlpha = subtitleAlpha + .03
        end
    end
    if timer <= 0 then
        press_Space(devFont)
    end
    title_Fade()
end