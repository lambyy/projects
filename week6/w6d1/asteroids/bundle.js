/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(1);

document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext('2d');
  const game = new GameView(ctx);
  const startGame = game.start.bind(game);
  startGame();
});

// const game = new GameView(ctx);
// game.start.bind(game)();


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval( () => {
    this.game.step();
    this.game.draw(this.ctx);
  }, 20);
};

module.exports = GameView;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);
const MovingObject = __webpack_require__(5);

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


/***/ }),
/* 4 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m ];
  },
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  }
};

module.exports = Util;


/***/ }),
/* 5 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);