--NOTE: THIS IS A TEMPLATE SCRIPT TO SHOW HOW TO DRAW TEXT ON SCREEN

draw.SetFont(draw.CreateFont("Tahoma", 16, 800))
local screenSize = {x = 0, y = 0}
local me

local function drawInfo()
    if not draw.Color then
        draw.Color(255, 255, 255, 255)
    end
    if not me then
        me = entities.GetLocalPlayer()
        return
    end

    screenSize.x, screenSize.y = draw.GetScreenSize()
    local drawPOS = {x = screenSize.x * 0.05, y = screenSize.y * 0.20}
    local moveFactorY = 0.05
    local moveFactorX = 0.15

    local Info = {
        "exampleProp: " .. tostring(exampleVariable),
    }

    for i, info in ipairs(Info) do
        draw.Text(drawPOS.x, drawPOS.y, info)
        drawPOS.y = drawPOS.y + (screenSize.y * moveFactorY)

        if drawPOS.y > screenSize.y * 0.80 then
            drawPOS.y = screenSize.y * 0.20
            drawPOS.x = drawPOS.x + (screenSize.x * moveFactorX)
        end
    end
end

callbacks.Register("Draw", drawInfo)