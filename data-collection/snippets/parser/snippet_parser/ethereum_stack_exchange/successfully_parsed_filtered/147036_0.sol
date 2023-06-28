
pragma solidity >=0.8.2 <0.9.0;

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

    function createCar(string memory _licensePlate, string memory _chassisNumber, string memory _brand, string memory _carType, string memory _colour) public {
        require(bytes(_licensePlate).length > 0, "Please fill in your license plate");
        require(bytes(_chassisNumber).length > 0, "Please fill in your chassis number");
        require(bytes(_brand).length > 0, "Please fill in the brand of the car");
        require(bytes(_carType).length > 0, "Please fill in the car type");
        require(bytes(_colour).length > 0, "Please fill in the colour of the car");
        cars.push (Car(_licensePlate, _chassisNumber, _brand, _carType, _colour, 0, owner));

    }

    function getCarInfo() external view returns(Car[] memory) {
        return cars;
    }


   
        
        
        
    



}
