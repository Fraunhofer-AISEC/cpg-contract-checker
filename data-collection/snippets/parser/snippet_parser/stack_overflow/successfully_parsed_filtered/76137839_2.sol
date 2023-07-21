
pragma solidity ^0.8.9;

contract Rental {
    struct Bike{
        string name;
        uint rangePower;
        uint maxSpeed;
        uint batteryCapacity;
        uint costPerHour;
        bool isAvailable;
    }
    
    
    address owner;
    uint totalHours=0;
    uint totalRents=0;
    uint totalEbikes;

    
    Bike[] bikes;
 
    constructor(){
        
        owner = msg.sender;

        
        bikes.push(Bike("48v/12ah Electric Bicycle Electric Bike", 60, 50, 576, 70, true));
        bikes.push(Bike("51v/17ah Electric Bicycle Electric Bike", 60, 50, 867, 70, true));
        bikes.push(Bike("43v/11ah Electric Bicycle Electric Bike", 60, 50, 473, 70, true));
        bikes.push(Bike("60v/18ah Electric Bicycle Electric Bike", 60, 50, 1080, 70, true));

        totalEbikes=bikes.length;
    }
    
    function getBikes() public view returns (Bike[] memory){
        return bikes;
    }

    function getNumOfBikes() public view returns (uint){
        return bikes.length;
    }

    function changeAvailability() public {
        bikes[1].isAvailable=false;
    }

    function rent(uint _totalHours) payable public {
        totalHours+=_totalHours;
        totalRents++;
    }


}
