-- love.load, love.update(dt) , love.draw()
-- desenhe um círculo de 50px de raio no extermo esquerdo da tela
-- e um quadrado de 100px de lado no extremo direito da tela
-- facam com que ambos caminhem em direção ao centro da tela 1px/quadro
-- após eles chegarem no centro da tela, eles devem parar de se mover.

function love.load()
  xCircle = 100
  xSquare = love.graphics.getWidth()-100

end


function love.update(dt)

  if xCircle <= love.window.getWidth()/2 then
    xCircle = xCircle+1
  end

  if xSquare > love.window.getWidth()/2 then
    xSquare = xSquare-1
  end

end

function love.draw()
  love.graphics.circle("fill", xCircle, 50, 50)
  love.graphics.rectangle("fill", xSquare, 50, 100, 100)

end
