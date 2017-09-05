const Asteroid = require('./asteroid.js');

function Game() {
  this.asteroids = this.addAsteroids();
}

Game.DIM_X = 900;
Game.DIM_Y = 900;
Game.NUM_ASTEROIDS = 8;

Game.prototype.addAsteroids = function() {
  const asteroids = [];

  for(let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let a = new Asteroid({
      pos: this.randomPosition(),
      game: this
    });
    asteroids.push(a);
  }
  return asteroids;
};

Game.prototype.randomPosition = function() {
  let x = Math.random() * Game.DIM_X;
  let y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach(asteroid => asteroid.draw(ctx));
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(asteroid => asteroid.move());
};

Game.prototype.wrap = function(pos) {
  if (pos[0] >= Game.DIM_X) {
    pos[0] = 0;
  } else if (pos[0] <= 0) {
    pos[0] = Game.DIM_X;
  }

  if (pos[1] >= Game.DIM_Y) {
    pos[1] = 0;
  } else if (pos[1] <= 0) {
    pos[1] = Game.DIM_Y;
  }

  return pos;
};

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    for (let j = 0; j < this.asteroids.length; j++) {
      if (i === j) {
        continue;
      }
      if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
        alert("COLLISION");
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(asteroid) {
  const idx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(idx, idx);
};

module.exports = Game;
