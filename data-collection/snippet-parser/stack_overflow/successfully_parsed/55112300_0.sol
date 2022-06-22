`pragma solidity ^0.5.4;

contract StoreIntegerValue{
    address owner;
    int sensorData;

    constructor (int _sensorData) public  {
        sensorData = _sensorData;
        owner = msg.sender;
    }

    function setSensorData(int _sensorData) public {
        require(msg.sender == owner);
        sensorData = _sensorData;
    }

    function getSensorData() public returns (int) {
        require(msg.sender == owner);
        return sensorData;
    }
}` 
