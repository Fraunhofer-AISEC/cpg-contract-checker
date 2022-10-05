
pragma solidity 0.7.4;

contract Factory {
    event NewChild(address child);

    
    function newChild(uint256 param) public payable {

        
        Child cld = new Child{value: msg.value}(param);

        emit NewChild(address(cld));
    }
}

contract Child {
    uint256 public id;

    
    constructor(uint256 param) public payable {
        id = param;
    }
}
