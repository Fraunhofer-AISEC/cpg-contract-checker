pragma solidity ^0.5.17;

contract Test {
    uint256 amount;

    constructor() public {}

    function join() public {
        amount += 100;
    }

    function leave() public {
        amount -= 100;
    }
}
