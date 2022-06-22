pragma solidity ^0.4.18;

contract Ive {

address public creator;
address public owner;

constructor () public {
    creator = msg.sender;
    owner = msg.sender;
}

function setOwner(address _owner) external {
    owner = _owner;
    
    
}

}
