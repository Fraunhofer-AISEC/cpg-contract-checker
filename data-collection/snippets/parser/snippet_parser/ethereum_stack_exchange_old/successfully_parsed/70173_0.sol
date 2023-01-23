pragma solidity ^0.5.0;

contract Election {
    
    address public chairman;

    constructor () public {
      chairman = msg.sender;
    }

    function register() public payable{
        chairman.transfer(1.0);
    }
}
