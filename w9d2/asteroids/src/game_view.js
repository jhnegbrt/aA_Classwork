const Game = require("./game");

function GameView(ctx){
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function(){
  let that = this;
  setInterval(function callback(){
    that.game.moveObjects();
    that.game.draw(that.ctx);
  }, 20)
};

module.exports = GameView;