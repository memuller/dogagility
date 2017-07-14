gameover = {

load = function()


end ,

draw = function()
  love.graphics.print("THIS CANNOT CONTINUE", 250, 500)
end ,

update = function()

end ,

keyPressed = function(k)
  if morreu and k then
    restart = true
    scene = "game"
  end
end ,

keyReleased = function()

end
}
