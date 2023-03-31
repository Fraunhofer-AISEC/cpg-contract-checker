
contract CarApp {

    address public owner;

    struct Car {
        string licensePlate;
        string chassisNumber;
        string brand;
        string carType;
        string colour;
        uint256[] mileageHistory;
        address owner;
    }

    constructor() {
        owner = msg.sender;
        
    }


    mapping (string => Car) public cars;
    


    function createCar(string memory _licensePlate, string memory _chassisNumber, string memory _brand, string memory _carType, string memory _colour, uint256 _currentMileage) external returns (bool) {
        require(bytes(_licensePlate).length > 0, "Please fill in your license plate");
        require(bytes(_chassisNumber).length > 0, "Please fill in your chassis number");
        require(bytes(_brand).length > 0, "Please fill in the brand of the car");
        require(bytes(_carType).length > 0, "Please fill in the car type");
        require(bytes(_colour).length > 0, "Please fill in the colour of the car");
        
        cars[_licensePlate].licensePlate = _licensePlate;
        cars[_licensePlate].chassisNumber = _chassisNumber;
        cars[_licensePlate].brand = _brand;
        cars[_licensePlate].carType = _carType;
        cars[_licensePlate].colour = _colour;
        cars[_licensePlate].mileageHistory.push(_currentMileage);
        cars[_licensePlate].owner = msg.sender;
        
    }
}
   













