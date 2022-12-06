pragma solidity ^0.5.0;

contract Election {
    mapping(uint => UserRequest) public userRequest;
    
    address payable chairman;

    
    constructor () public payable {
        chairman = msg.sender;
    }

    function register() public payable{
        chairman.transfer(1 ether);
    }
}
