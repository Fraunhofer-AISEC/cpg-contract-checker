
pragma solidity ^0.8.4;

contract Box_v1 {
    uint256 public x;
    bool private initialized;

    function initialize(uint256 _x) public {
        require(!initialized, "Contract instance has already been initialized");
        initialized = true;
        x = _x;
    }
}
