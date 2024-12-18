Player = Object:extend()

function Player:new(whichPlayer)
	self.width = 20
	self.height = 100
	self.y = love.graphics.getHeight() / 2
	self.speed = 500
	if whichPlayer == 1 then
		self.whichPlayer = 1
		self.x = 50
	else
		self.whichPlayer = 2
		self.x = love.graphics.getWidth() - self.width - 50
	end
end

function Player:update(dt)
	self:move(dt)
	self:checkBoundaries()
end

function Player:move(dt)
	if self.whichPlayer == 1 then
		if love.keyboard.isDown("w") then
			self.y = self.y - self.speed * dt
		elseif love.keyboard.isDown("s") then
			self.y = self.y + self.speed * dt
		end
	else
		if love.keyboard.isDown("up") then
			self.y = self.y - self.speed * dt
		elseif love.keyboard.isDown("down") then
			self.y = self.y + self.speed * dt
		end
	end
end

function Player:checkBoundaries()
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
