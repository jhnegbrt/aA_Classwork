const MovingObject = require("./moving_object");
const Util = require("./utils");

function Asteroid(obj){

  obj.color = "purple";
  obj.radius = "15";
  obj.vel = Util.randomVec(10);
  
  MovingObject.call(this, obj);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
