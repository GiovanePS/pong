Object = require("classic")
Player = require("player")
require("ball")

function love.load()
	player1 = Player(1)
	player2 = Player(2)
	Ball:load()
end

function love.update(dt)
	player1:update(dt)
	player2:update(dt)
	Ball:update(dt)
end

function love.draw()
	player1:draw()
	player2:draw()
	Ball:draw()
end

function checkColision(a, b)
	if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
		return true
	end

	return false
end
