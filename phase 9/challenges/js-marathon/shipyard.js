// YOUR CODE GOES HERE
let launchpad = (ship, crewMembers, rocket) => {
  console.log("Initializing preflight procedures on " + ship.name);
  ship.loadCrew(crewMembers);
  console.log("The captain will be " + ship.captain());
  ship.mountPropulsion(rocket);
  rocket.addFuel(10);
  ship.takeOff();
};

var Ship = function Ship(name) {
  this.name = name;
  this.crew = new Array();
  this.propulsion = null;
  this.loadCrew = function(members) {
    for (var i = 0; i < members.length; i++) {
      this.crew.push(members[i]);
      console.log(members[i].name + " has boarded the ship");
    }
  };
  this.captain = function() {
    var number = this.crew.length;
    var random_number = Math.floor(Math.random() * number);
    return this.crew[random_number].name;
  };
  this.mountPropulsion = function(rocket) {
    this.propulsion = rocket;
    console.log("Propulsion has been mounted");
  };
  this.takeOff = function() {
    if(this.propulsion.fire()) {
      console.log("Taking off");
    } else {
      console.log("Taking off failed.");
    }
  }
};

var rocket = {
  fuel: 0,
  addFuel: function(fuel) {
    this.fuel = fuel;
  },
  fire: function() {
    if(this.fuel > 0) {
      this.fuel--;
      console.log("Engines have fired. " + this.fuel + " fuel left in the tank.");
      return true;
    } else {
      console.log("Engines failed to fire. No fuel");
      return false;
    }
  }
}

var CrewMember = function CrewMember(name) {
  this.name = name;
  this.trained = false;
};

let trainCrew = (crewNames) => {
  crewMembers = [];
  for (var i = 0; i < crewNames.length; i++) {
    crewMember = new CrewMember(crewNames[i])
    crewMember.trained = true;
    crewMembers.push(crewMember);
  }
  return crewMembers;
};

var ship = new Ship("CoolShip");

var crewNames = ['Ken', 'Omid', 'Gen', 'Jenah'];

var crewMembers = trainCrew(crewNames);

launchpad(ship, crewMembers, rocket);