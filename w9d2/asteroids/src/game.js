const Asteroid = require("./asteroid");

function Game() {
  this.num_asteroids = 12;
  this.dim_x = 280;
  this.dim_y = 140;
  this.asteroids = this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  let asteroids = [];
  while (asteroids.length < this.num_asteroids) {
    let obj = { pos: this.randomPosition(), game: this };
    let asteroid = new Asteroid(obj);
    asteroids.push(asteroid);
  }
  return asteroids;
};

Game.prototype.randomPosition = function() {
  let pos = [];
  pos.push(Math.random() * this.dim_x);
  pos.push(Math.random() * this.dim_y);
  return pos;
};

Game.prototype.draw = function(ctx) {
  
  ctx.clearRect(0, 0, this.dim_x + 100, this.dim_y + 100);

  this.asteroids.forEach(function callback(asteroid) {
    asteroid.draw(ctx);
  })
};

Game.prototype.moveObjects = function(){

  this.asteroids.forEach(function callback(asteroid){
    asteroid.move();
  })

}

Game.prototype.wrap = function(pos){
  if (pos[0] > this.dim_x + 100){
    pos[0] = 0;
  } else if (pos[0] < 0){
    pos[0] = this.dim_x + 100;
  }
  if (pos[1] > this.dim_y + 100){
    pos[1] = 0;
  } else if (pos[1] < 0){
    pos[1] = this.dim_y + 100;
  }
};

Game.prototype.checkCollisions = function(){

  for (i = 0; i < this.asteroids.length - 1; i++){
    for(j = i + 1; j < this.asteroids.length; j++){
      this.asteroids[i].isCollidedWith(this.asteroids[j])
    }
  }

};

module.exports = Game;