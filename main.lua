-- love.load, love.update(dt) , love.draw()

-- só um tipo de dado: table (hashmap, hash, dicionário)

-- dog.collides(obj) -- deve retornar true/façse se colidindo com o objeto
-- no update do love ele deve chegar colisão e setar uma variávelocidade
-- que depois é usada para imprimir uma msg de erro

function newDog(xD, yD, speedD, deltaD)
  local tam = 100
  local dog = {
    y = yD,
    x = xD,
    speed = speedD,
    deltaY = deltaD,
    tam = tam
  }

  dog.draw = function(dog)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", dog.x, dog.y, dog.tam, dog.tam)

  end

  dog.update = function(dog)
    if dog.deltaY > 0 then --indo pra baixo
      if dog.y+100 <= love.graphics.getHeight() then
        dog.y = dog.y + dog.deltaY
      end
    elseif dog.deltaY < 0 then --indo pra cima
      if dog.y >= 0 then
        dog.y = dog.y + dog.deltaY
      end
    end

    for i, v in ipairs(vet) do
      morreu = dog:collides(v)
      if morreu then
        break
      end
    end

  end

  dog.moveUp = function(dog)
    dog.deltaY = -dog.speed
  end

  dog.moveDown = function(dog)
    dog.deltaY = dog.speed
  end

  dog.collides = function(dog, obj)

    local morreu =
      ((dog.x <= obj.x and dog.x +100 > obj.x) or
      (obj.x <= dog.x and obj.x+100 > dog.x))
      and
      ((dog.y <= obj.y and dog.y +100 > obj.y) or
      (obj.y <= dog.y and obj.y+100 > dog.y))


    return morreu
  end


  return dog
end


function newObstacle(xO, yO)
  local tam = 100
  local speed = 3
  local obstacle = {
    x = xO,
    y = yO,
    tam = tam,
    speed = speed
}

    obstacle.draw = function(obstacle)
      love.graphics.setColor(255, 0, 0)
      love.graphics.rectangle("fill", obstacle.x, obstacle.y, obstacle.tam, obstacle.tam)

    end

    obstacle.update = function(obstacle)

      obstacle.x = obstacle.x - obstacle.speed

    end


  return obstacle
end


function love.load()

  dog = newDog(love.graphics.getWidth()/2-100, 250, 5, 0)
  vet = {newObstacle(500, 50), newObstacle(500, 450) } --newObstacle(650, 200)
  morreu = false

end

function love.update(dt)

  dog:update()
  for i, v in ipairs(vet) do
    v:update()
  end

end

function love.keypressed(k)
  if k=="up" then
    dog:moveUp()
  end

  if k=="down" then
    dog:moveDown()
  end

end

function love.keyreleased(k)
  dog.deltaY = 0
end

function love.draw()

  dog:draw()
  for i, v in ipairs(vet) do
    v:draw()
  end

  if morreu then
    love.graphics.print("THIS CANNOT CONTINUE", 0, 0)
  end
end
