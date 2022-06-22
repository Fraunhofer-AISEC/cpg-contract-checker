pragma solidity ^0.8.0;

contract Control {
address public owner;
address public newOwner;

event OwnershipTransferred(address indexed _from, address indexed _to);

function Owned() public {
    owner = msg.sender;
}


modifier onlyOwner {
    require(msg.sender == owner);
    _;
}


constructor() payable {
    
}


function withdrawAll() public payable onlyOwner {
    require(payable(msg.sender).send(address(this).balance));
}


receive() external payable { 
    }
    
}
