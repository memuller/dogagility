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
