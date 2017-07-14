-- love.load, love.update(dt) , love.draw()

-- só um tipo de dado: table (hashmap, hash, dicionário)

-- o objeto dog tenha uma propriedade y que representa sua posiçao Y na tela, e é usada para movimentar o cachorro/desenhar ele na posiçáo
function love.load()

  dog = {
    y = 50,
    x = love.graphics.getWidth()/2-100,
    speed = 5,
    deltaY = 0
  }
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
  love.graphics.rectangle("fill", dog.x, dog.y, 100, 100)
  love.graphics.print(dog.y, 0, 0)
end
