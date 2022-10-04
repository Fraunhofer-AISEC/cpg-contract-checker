pragma solidity ^0.8;

contract Storage
    bool initialized;
    uint256 value;

    constructor() {
        initialized = true;
    }

    function init() external {
        require (!initialized, 'Already initialized');
        initialized = true;
    }

    function retrieve() external returns (uint256) {
        return value;
    }

    function setter(uint256 val) external {
        value = val;
    }
}
