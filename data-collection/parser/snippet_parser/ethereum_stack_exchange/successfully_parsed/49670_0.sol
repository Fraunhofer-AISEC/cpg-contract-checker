mapping(uint => Vehicle) vehicles;


function newCar(bytes32 _color, bytes32 _make, uint32 _year) public returns (uint ID) {
    var car = vehicles[carID];
    car.color = _color;
    car.make = _make;
    car.year = _year;
    carID ++;
    ID = carID;
}