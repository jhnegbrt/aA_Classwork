/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Asteroid(obj){\n\n  obj.color = \"purple\";\n  obj.radius = \"15\";\n  obj.vel = Util.randomVec(10);\n  \n  MovingObject.call(this, obj);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game() {\n  this.num_asteroids = 12;\n  this.dim_x = 280;\n  this.dim_y = 140;\n  this.asteroids = this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function() {\n  let asteroids = [];\n  while (asteroids.length < this.num_asteroids) {\n    let obj = { pos: this.randomPosition(), game: this };\n    let asteroid = new Asteroid(obj);\n    asteroids.push(asteroid);\n  }\n  return asteroids;\n};\n\nGame.prototype.randomPosition = function() {\n  let pos = [];\n  pos.push(Math.random() * this.dim_x);\n  pos.push(Math.random() * this.dim_y);\n  return pos;\n};\n\nGame.prototype.draw = function(ctx) {\n  \n  ctx.clearRect(0, 0, this.dim_x + 100, this.dim_y + 100);\n\n  this.asteroids.forEach(function callback(asteroid) {\n    asteroid.draw(ctx);\n  })\n};\n\nGame.prototype.moveObjects = function(){\n\n  this.asteroids.forEach(function callback(asteroid){\n    asteroid.move();\n  })\n\n}\n\nGame.prototype.wrap = function(pos){\n  if (pos[0] > this.dim_x + 100){\n    pos[0] = 0;\n  } else if (pos[0] < 0){\n    pos[0] = this.dim_x + 100;\n  }\n  if (pos[1] > this.dim_y + 100){\n    pos[1] = 0;\n  } else if (pos[1] < 0){\n    pos[1] = this.dim_y + 100;\n  }\n};\n\nGame.prototype.checkCollisions = function(){\n\n  for (i = 0; i < this.asteroids.length - 1; i++){\n    for(j = i + 1; j < this.asteroids.length; j++){\n      this.asteroids[i].isCollidedWith(this.asteroids[j])\n    }\n  }\n\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx){\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n  let that = this;\n  setInterval(function callback(){\n    that.game.moveObjects();\n    that.game.draw(that.ctx);\n  }, 20)\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = MovingObject;\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nwindow.Game = Game;\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nwindow.GameView = GameView;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  let canvas = document.getElementById(\"game-canvas\");\n  let context = canvas.getContext(\"2d\")\n  window.context = context\n  let gameView = new GameView(context);\n  gameView.start();\n});\n\nconsole.log(\"Webpack is working!\");\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n};\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n\n};\n\nMovingObject.prototype.move = function(){\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.game.wrap(this.pos);\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject){\n\n  let a = this.pos[0] - otherObject.pos[0];\n  let b = this.pos[1] - otherObject.pos[1];\n\n  let distance = Math.sqrt((Math.pow(a, 2) + Math.pow(b, 2)));\n\n  if (distance <= this.radius + otherObject.radius){\n    alert(\"COLLISION\")\n  }\n};\n\n\n\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass){\n    childClass.prototype = Object.create(parentClass.prototype)\n    childClass.prototype.constructor = childClass\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n}\n\nmodule.exports = Util;\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;