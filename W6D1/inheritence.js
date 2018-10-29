function MovingObject () {}

Function.prototype.inherits = function(superduper){

  // function Surrogate() {}
  // Surrogate.prototype = superduper.prototype;
  // this.prototype = new Surrogate();

  this.prototype = Object.create(superduper.prototype);
  this.prototype.constructor = this;


};
function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

// window.asteroid = Asteroid;

MovingObject.prototype.stuff = function(){console.log("stuffin muffins");};
console.log(MovingObject.prototype);

Ship.prototype.shippy = function(){console.log("I'm a little shippy, short and stout");};
console.log(MovingObject.prototype);

let ship2 = new Ship();
let asteroid2 = new Asteroid();
// window.ship = ship;



console.log(ship2.__proto__.constructor);
console.log(asteroid2.__proto__);
ship2.stuff();
asteroid2.stuff();
ship2.shippy();
// asteroid.shippy(); ==> fails
