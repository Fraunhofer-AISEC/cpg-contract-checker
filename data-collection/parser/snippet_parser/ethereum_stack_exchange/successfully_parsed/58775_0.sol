pragma solidity ^0.4.24;

contract Test {
    address[] public signups;
    uint createTime;

    constructor() public {
        createTime = now;
    }

    function signupsStopAfter10Min() public {
        require(now < createTime + 10 minutes);
        signups.push(msg.sender);
    }
}
