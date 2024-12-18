Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 20
	self.speed = 350
	self.xVel = -self.speed
	self.yVel = 0
end

function Ball:update(dt)
	self:move(dt)
	self:collide()
end

function Ball:collide()
	local player1Collision = checkColision(self, player1)
	local player2Collision = checkColision(self, player2)
	if player1Collision or player2Collision then
		self.xVel = -self.xVel
		local middleBall = self.y + self.height / 2
		local middlePlayer
		if player1Collision then
			middlePlayer = player1.y + player1.height / 2
		else
			middlePlayer = player2.y + player2.height / 2
		end
		local collisionPosition = middleBall - middlePlayer
		self.yVel = collisionPosition * 5
	end

	if self.y < 0 then
		self.y = 0
		self.yVel = -self.yVel
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
		self.yVel = -self.yVel
	end

	if self.x < 0 then
		self.x = 0
		self.xVel = -self.xVel
	elseif self.x + self.width > love.graphics.getWidth() then
		self.x = love.graphics.getWidth() - self.width
		self.xVel = -self.xVel
	end
end

function Ball:move(dt)
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel * dt
end

function Ball:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
