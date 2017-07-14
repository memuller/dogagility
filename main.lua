-- love.load, love.update(dt) , love.draw()

-- só um tipo de dado: table (hashmap, hash, dicionário)

-- na cena de game over você pode apertar qualquer tecla
-- para reiniciar o jogo.

-- criar objetos cena representando as cenas do jogo (2)
-- estes objetos devem seguir uma API tendo os métodos:
-- * draw
-- * load
-- * update
-- * keypressed
-- * keyreleased

-- estes métodos serão chamados pela API principal do love quando pertinente
-- e cada uma destas cenas deve existir em um arquivo separado na pasta scenes/

require('lib/dog')
require('lib/obstacles')
require('scenes/game')
require('scenes/gameover')

function love.load()
  scene = "game"
  game.load()

end

function love.update(dt)
  game.update()
end

function love.keypressed(k)
  if scene == "game" then
      game.keyPressed(k)
  end

  if scene == "gameover" then
    gameover.keyPressed(k)
  end

end

function love.keyreleased(k)
  if scene == "game" then
    game.keyReleased(k)
  end
end


function love.draw()

  if not morreu then
    game.draw()
  else
    scene = "gameover"
    gameover.draw()
  end

end
