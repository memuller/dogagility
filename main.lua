-- love.load, love.update(dt) , love.draw()

-- só um tipo de dado: table (hashmap, hash, dicionário)


-- crie um objeto representando um obstáculo, que vai ser desenhado como um quadrado vermelho

-- Factory: um método cuja função é contruir e retornar objetos de uma classe
-- crie um método chamado newObstacle que retorne um objeto obstáculo tendo x,y

-- crie uma propriedade tamanho para os obstáculos que vai ser usada como lado na hora de desenhar.
-- crie uma propriedade draw nos obstáculos cujo valor seja uma função
-- e estafunção desenhe o objeto obstáculo.
-- daí no love.draw vo¨ê vai chamar estas funções.

-- crie uma fábrica de cachorros que retorne cachorro,
-- que tem propriedades x, y, tamanho, speed, deltaY
-- e tenha um método draw que seja completamente responsável por desenhar o cachoro.

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

return dog
end


function newObstacle(xO, yO)
  local tam = 100
  local obstacle = {
    x = xO,
    y = yO,
    tam = tam,
    draw = function()
      love.graphics.setColor(255, 0, 0)
      love.graphics.rectangle("fill", xO, yO, tam, tam)

    end
}
  return obstacle
end


function love.load()

  dog = newDog(love.graphics.getWidth()/2-100, 50, 5, 0)
  ob1 = newObstacle(500, 50)
  ob2 = newObstacle(500, 200)

end

function love.update(dt)
  if dog.deltaY > 0 then --indo pra baixo
    if dog.y+100 <= love.graphics.getHeight() then
      dog.y = dog.y + dog.deltaY
    end
  elseif dog.deltaY < 0 then --indo pra cima
    if dog.y >= 0 then
      dog.y = dog.y + dog.deltaY
    end
  end

end

function love.keypressed(k)
  if k=="up" then
    dog.deltaY = -dog.speed
  end

  if k=="down" then
    dog.deltaY = dog.speed
  end

end

function love.keyreleased(k)
  dog.deltaY = 0
end

function love.draw()

  dog.draw(dog)
  ob1.draw()
  ob2.draw()
  love.graphics.print(dog.y, 0, 0)
end
