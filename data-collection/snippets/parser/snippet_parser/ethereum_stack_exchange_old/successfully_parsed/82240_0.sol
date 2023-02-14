pragma solidity ^0.6.5;

contract TestImmutable {
    uint256 public immutable a;

    
    constructor (uint256 _a) public {
        a = _a;
    }

    
    function setA (uint256 _a) public {
        a = _a;
    }
}
