contract CarApp {

    address public owner;

    struct Car {
        string licensePlate;
        string chassisNumber;
        string brand;
        string carType;
        string colour;
        uint256 mileage;
        address owner;
    }

    constructor() {
        owner = msg.sender;
    }


    Car[] public cars;
    mapping (string => uint256) public plates;

    function createCar(string memory _licensePlate, string memory _chassisNumber, string memory _brand, string memory _carType, string memory _colour) public {
        require(bytes(_licensePlate).length > 0, "Please fill in your license plate");
        require(bytes(_chassisNumber).length > 0, "Please fill in your chassis number");
        require(bytes(_brand).length > 0, "Please fill in the brand of the car");
        require(bytes(_carType).length > 0, "Please fill in the car type");
        require(bytes(_colour).length > 0, "Please fill in the colour of the car");
        cars.push(Car(_licensePlate, _chassisNumber, _brand, _carType, _colour, 0, msg.sender));
        plates[_licensePlate] = cars.length - 1;
    }

    function getCarInfo() external view returns(Car[] memory) {
        return cars;
    }


   function addMileage(string memory _licensePlate, uint256 _mileage) public {
        require(bytes (_licensePlate).length > 0, "Please fill in your license plate");
        require(_mileage > cars[plates[_licensePlate]].mileage, "The mileage should be higher than the previous one");
        require(cars[plates[_licensePlate]].owner == msg.sender, "Only owner can change mileage");
        cars[plates[_licensePlate]].mileage = _mileage;
    }

}
