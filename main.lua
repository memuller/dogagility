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

-- crie um vetor com todos os obstáculos
-- percorra este vetor chamando draw() na hora de montar a tela.

-- crie dois métodos no objeto dog - moveUp e moveDown que movam o dog [velocidade] espaços para cima ou para baixo. estes métodos devem ser usados para mover o dog quando teclas correspondentes são pressionadas

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

  end

  dog.moveUp = function(dog)
    dog.deltaY = -dog.speed
  end

  dog.moveDown = function(dog)
    dog.deltaY = dog.speed
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
  vet = {newObstacle(500, 50), newObstacle(500, 200)}

end

function love.update(dt)

  dog:update()

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
    v.draw()
  end
  love.graphics.print(dog.y, 0, 0)
end
