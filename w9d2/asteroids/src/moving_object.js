function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();

};

MovingObject.prototype.move = function(){
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function(otherObject){

  let a = this.pos[0] - otherObject.pos[0];
  let b = this.pos[1] - otherObject.pos[1];

  let distance = Math.sqrt((Math.pow(a, 2) + Math.pow(b, 2)));

  if (distance <= this.radius + otherObject.radius){
    alert("COLLISION")
  }
};




module.exports = MovingObject;
