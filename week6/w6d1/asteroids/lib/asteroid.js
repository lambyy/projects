const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid(asteroidOptions) {
  const options = {
    pos: asteroidOptions['pos'],
    color: Asteroid.COLOR,
    radius: Asteroid.RADIUS,
    vel: Util.randomVec(3),
    game: asteroidOptions['game']
  };
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

Asteroid.COLOR = 'orange';
Asteroid.RADIUS = 25;

// const asteroid = new Asteroid([0,0]);
// console.log("I am asteroid", asteroid);
// asteroid.move();
// console.log("I am moved asteroid", asteroid);



module.exports = Asteroid;
