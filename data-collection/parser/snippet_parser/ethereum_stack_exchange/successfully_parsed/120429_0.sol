
pragma solidity ^0.8.4;

contract Vote {
    address[] public Initiator;

    function setInitiator() public { 
        Initiator.push(msg.sender);
    }

}
