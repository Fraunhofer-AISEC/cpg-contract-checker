pragma solidity ^0.8.6;

contract Contract1 {
    
    uint index;
    address owner;
    uint256[] values;
    
    mapping(uint => address payable) addresses;
    
    constructor() {
       owner = msg.sender;
    }
    
    function makeAPay() public payable {
        uint tempValue = msg.value/(10**6);
        addresses[index] = payable(msg.sender);
        values[index] = tempValue;
        index++;
    }
    
    
    function getAdr() public view returns(address) {
        if(index == 0){
            return owner;
        }
        return addresses[0];
    }
    
    function getValue() public view returns(uint) {
        if(index == 0){
            return 0;
        }
            return values[0];
    }
    
     function getIndex() public view returns(uint) {
            return index;
    }

    function getOwner() public view returns(address) {
            return owner;
    }
}
