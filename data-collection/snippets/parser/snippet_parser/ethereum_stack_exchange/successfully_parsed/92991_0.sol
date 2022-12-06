

pragma solidity ^0.5.2;


contract Auction{
    mapping(address=> uint)public bids;

    struct Car{
        string description;
        uint value;
        uint built_year;
    }
    
    Car public private_car;
    mapping(address=> Car) public cars;
    
    
    constructor(string memory _description, uint _value, uint _built_year) public{
    private_car.description = _description;
    private_car.value = _value;
    private_car.built_year = _built_year;
    
       cars[msg.sender] = private_car;
    }
    
    function bid() payable public{
        bids[msg.sender] = msg.value;
    }
    
    
}
