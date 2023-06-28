pragma solidity ^0.4.21;

contract VehRegistry {
    address public owner;

    event Event(string vin, string mileage, string date);

    function VehRegistry() public {
        owner = msg.sender;
    }

    function registerEvent(string vin, string mileage, string date) public {
        require(msg.sender == owner);
        emit Event(vin, mileage, date);
    }

}
