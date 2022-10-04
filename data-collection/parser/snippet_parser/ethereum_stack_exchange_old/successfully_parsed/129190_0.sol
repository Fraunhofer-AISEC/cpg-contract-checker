pragma solidity ^0.8.2;

uint peoplelBeforeMe = 0;

struct Queue {
    address customerAddress;
    uint peoplelBeforeMe;
    uint256 arrivalTime;
}

Queue[] private serviceQueue;

function registerIntoQueue() public {
    serviceQueue.push ( Queue(msg.sender, peoplelBeforeMe, block.timestamp ) );
    peoplelBeforeMe++;
}
