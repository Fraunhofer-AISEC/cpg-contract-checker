pragma solidity ^0.5.2;

contract MyContract {
    uint networkid;

    constructor(uint _networkid) public {
        networkid = _networkid;
    }
}
