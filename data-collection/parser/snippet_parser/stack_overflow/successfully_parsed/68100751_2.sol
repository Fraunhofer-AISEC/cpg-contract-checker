pragma solidity ^0.8.5;

interface IRemote {
    function foo() external view returns (bool);
}

contract MyContract {
    IRemote remote;

    constructor() {
        remote = IRemote(address(0x123));
    }

    function getFoo() external view returns (bool) {
        bool returnedValue = remote.foo();
        return returnedValue;
    }
}
