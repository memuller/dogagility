-- love.load, love.update(dt) , love.draw()
-- cachorro comece no topo da tela e desça até o final
-- desacelerando lentamente conforme se aproxima do final
-- velocidade do cachorro seja diretamente proporcioinal à distância restante

function love.load()
  xSquare = love.graphics.getWidth()/2-100
  ySquare = 0
  deltaYSquare = 0
  targetY = love.graphics.getHeight() - 100
end

function love.update(dt)

  if ySquare <= targetY then
    distancia = targetY - ySquare
    ySquare = ySquare + distancia/50
    if targetY - ySquare < 2 then
      ySquare = targetY
    end
  end

end


function love.draw()
  love.graphics.rectangle("fill", xSquare, ySquare, 100, 100)

end
