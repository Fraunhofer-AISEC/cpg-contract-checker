struct Wheel {
    uint radius;
    uint width;
}

struct Vehicle {
    string model;
    uint wheelCount;
    mapping(uint => Wheel) wheels;
}

uint public vehicleCount = 0;
mapping(uint => Draw) public vehicles;

function getWheel( uint vid, uint wid) external view returns(Wheel memory) {
    return vehicles[vid].wheels[wid];
}
