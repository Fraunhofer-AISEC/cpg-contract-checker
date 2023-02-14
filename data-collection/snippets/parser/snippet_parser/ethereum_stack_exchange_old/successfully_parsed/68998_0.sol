pragma solidity 0.5.1;

contract EventChain {

    
    uint public latestEvent;

    event LogChainedEvent(address sender, uint previousEvent);

    function logData() public {
        emit LogChainedEvent(msg.sender, latestEvent);
        latestEvent++;
    }
}
