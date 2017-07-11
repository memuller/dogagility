-- love.load, love.update(dt) , love.draw()
-- apaga esta merda toda
-- coloque um quadrado no centro da tela
-- faça com que este quadrado se mova para cima e para baixo conforme
-- as setas direcionais correspondentes sejam pressionadas

function love.load()
  xSquare = love.graphics.getWidth()/2-100
  ySquare = 50
  deltaYSquare = 0
  yMovementIncrements = 5
end

function love.update(dt)
  ySquare = ySquare + deltaYSquare

end

function love.keypressed(k)
  if k=="up" then
    deltaYSquare = -yMovementIncrements
  end

  if k=="down" then
    deltaYSquare = yMovementIncrements
  end

end

function love.keyreleased(k)
  deltaYSquare = 0
end


function love.draw()
  love.graphics.rectangle("fill", xSquare, ySquare, 100, 100)

end
