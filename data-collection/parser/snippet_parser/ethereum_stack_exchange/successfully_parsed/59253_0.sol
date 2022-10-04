pragma solidity ^0.4.25;

contract Simplest {
    constructor() public {
    }

    function two_paths(bool _a) public pure returns (uint) {
        if (_a == true) {
            return 1;
        } else {
            return 0;
        }
    }
}
