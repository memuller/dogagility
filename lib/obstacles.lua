function newObstacle(xO, yO, speedO)
  local tam = 100
  local obstacle = {
    x = xO,
    y = yO,
    tam = tam,
    speed = speedO
}

  if obstacle.speed == nil then
    obstacle.speed = 5
  end
    obstacle.draw = function(obstacle)
      love.graphics.setColor(255, 0, 0)
      love.graphics.rectangle("fill", obstacle.x, obstacle.y, obstacle.tam, obstacle.tam)

    end

    obstacle.update = function(obstacle)

      obstacle.x = obstacle.x - obstacle.speed

    end


  return obstacle
end
