-- love.load, love.update(dt) , love.draw()


function love.load()
  xSquare = love.graphics.getWidth()/2-100
  ySquare = 50
  deltaYSquare = 0
  yMovementIncrements = 5
end

function love.update(dt)
  if deltaYSquare > 0 then --indo pra baixo
    if ySquare+100 <= love.graphics.getHeight() then
      ySquare = ySquare + deltaYSquare
    end
  elseif deltaYSquare < 0 then --indo pra cima
    if ySquare >= 0 then
      ySquare = ySquare + deltaYSquare
    end
  end

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
