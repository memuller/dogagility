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

-- obstáculos em cada frame devem se mover continuamente para a esquerda uma quantidade de pixels igual a sua velocidade


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
  vet = {newObstacle(500, 50) } --newObstacle(650, 200)
  morreu = false

end

function love.update(dt)

  dog:update()
  vet[1]:update()
  --vet[2]:update()
  obj = vet[1]

  comparisons = {
    (dog.x <= obj.x and dog.x +100 > obj.x),
    (obj.x <= dog.x and obj.x+100 > dog.x),
    (dog.y <= obj.y and dog.y +100 > obj.y),
    (obj.y <= dog.y and obj.y+100 > dog.y)
  }

  if
    ((dog.x <= obj.x and dog.x +100 > obj.x) or
    (obj.x <= dog.x and obj.x+100 > dog.x))
    and
    ((dog.y <= obj.y and dog.y +100 > obj.y) or
    (obj.y <= dog.y and obj.y+100 > dog.y))
  then
    morreu = true
  else
    morreu = false
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
  love.graphics.print(dog.y, 0, 0)
  love.graphics.print(vet[1].x, 0, 10)

  for i, c in ipairs(comparisons) do
    love.graphics.print(tostring(c), 0+(i*40), 50)
  end

  if morreu then
    love.graphics.print("aaaaaaa", 0, 0)
  end
end
