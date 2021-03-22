const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;
const Asteroid = require("./asteroid");
window.Asteroid = Asteroid;
const Game = require("./game");
window.Game = Game;
const GameView = require("./game_view");
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', (event) => {
  let canvas = document.getElementById("game-canvas");
  let context = canvas.getContext("2d")
  window.context = context
  let gameView = new GameView(context);
  gameView.start();
});

console.log("Webpack is working!");
