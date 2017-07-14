game = {
  load = function()
    dog = newDog(love.graphics.getWidth()/2-100, 250, 5, 0)
    vet = {newObstacle(500, 50, 2), newObstacle(500, 450) } --newObstacle(650, 200)
    morreu = false
    restart = false
  end ,

  update = function()
    if not morreu then
      dog:update()
      for i, v in ipairs(vet) do
        v:update()
      end

    elseif restart then
      game.load()
    end

  end ,

  draw = function()

    dog:draw()
    for i, v in ipairs(vet) do
      v:draw()
    end

  end ,

  keyPressed = function(k)
    if k=="up" then
      dog:moveUp()
    end

    if k=="down" then
      dog:moveDown()
    end
  end ,

  keyReleased = function(k)
    dog.deltaY = 0
  end

}
