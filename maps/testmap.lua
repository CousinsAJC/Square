function testmap_Load()
    map_X = {
        
    }
    map_Y = {

    }
    for i = 1, 20, 1
    do
        if i == 1 then
            map_X[i] = 0
        else
            map_X[i] = map_X[i-1] + 48
        end
    end
    for i = 1, 9, 1
    do
        if i == 1 then
            map_Y[i] = 0
        else
            map_Y[i] = map_Y[i-1] + 48
        end
    end

    map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }
end


function testmap_Update()
   
end



function testmap_Draw()
    for i = 1, 9, 1
    do
        for j = 1, 20, 1
        do
            if map[i][j] == 0 then
                love.graphics.setColor(0, 255, 50, 255)
                love.graphics.rectangle("fill", map_X[j], map_Y[i], 48, 48)
                --love.graphics.setColor(0, 255, 0, 255)
                --love.graphics.print(map_X[j], 20, 20)
                --love.graphics.print(map_Y[i], 20, 60)
            elseif map[i][j] == 1 then
                love.graphics.setColor(255, 255, 0, 255)
                love.graphics.rectangle("fill", map_X[j], map_Y[i], 48, 48)
                love.graphics.setColor(0, 255, 0, 255)
            elseif map[i][j] == 2 then
                love.graphics.setColor(0, 0, 0, 255)
                love.graphics.rectangle("fill", map_X[j], map_Y[i], 48, 48)
                love.graphics.setColor(0, 255, 0, 255)
            end
        end
    end
end