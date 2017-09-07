// Function.prototype.inherits = function(superclass) {
//   function Surrogate () {}
//
//   Surrogate.prototype = superclass.prototype;
//
//   this.prototype = new Surrogate;
//
//   this.prototype.constructor = this;
// };


Function.prototype.inherits = function(superclass) {
  this.prototype = Object.create(superclass.prototype);
  this.prototype.constructor = this;
};



function MovingObject () {}

MovingObject.prototype.velocity = function() {
  console.log('LIGHTSPEED');
};

function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.destination = function() {
  console.log('GOING TO MARS');
};


function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.crash = function() {
  console.log('BOOM');
};

const mo = new MovingObject;
const s = new Ship;
const a = new Asteroid;

mo.velocity();
s.velocity();
a.velocity();
s.destination();
// a.destination();
// mo.destination();
a.crash();
// s.crash();
// mo.crash();
