function MovingObject(options) {
  this.pos = options['pos'];
  this.vel = options['vel'];
  this.radius = options['radius'];
  this.color = options['color'];
  this.game = options['game'];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    Math.PI * 2
  );
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  const dx = this.pos[0] - otherObject.pos[0];
  const dy = this.pos[1] - otherObject.pos[1];
  const dist = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
  if (dist < (this.radius + otherObject.radius)) {
    this.collideWith(otherObject);
    return true;
  }
  return false;
};

MovingObject.prototype.collideWith = function(otherObject) {
  this.game.remove(otherObject);
  this.game.remove(this);
};

module.exports = MovingObject;

// const movingOptions = {
//   pos: [30, 30],
//   vel: [10, 10],
//   radius: 5,
//   color: 'purple'
// };
// const m = new MovingObject(movingOptions);
// console.log('I am m: ', m);
// m.move();
// console.log('I am new m: ', m);
