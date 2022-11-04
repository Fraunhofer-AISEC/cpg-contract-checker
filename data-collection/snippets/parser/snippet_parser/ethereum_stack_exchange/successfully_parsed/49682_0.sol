

uint public carID;
mapping(uint => Vehicle) cars;
uint[] public carListings;

function newCar(string _color, string _make, uint32 _year) public returns (uint ID) {
    carID ++;
    ID = carID;

    Vehicle storage car = cars[carID];
    car.color = _color;
    car.make = _make;
    car.year = _year;

    carListings.push(carID) -1;
}




uint public truckID;
mapping(uint => Vehicle) trucks;
uint[] public truckListings;


function newTruck(string _color, string _make, uint32 _year) public returns (uint ID) {
    truckID ++;
    ID = truckID;

    Vehicle storage truck = trucks[truckID];
    truck.color = _color;
    truck.make = _make;
    truck.year = _year;

    truckListings.push(truckID);
}
