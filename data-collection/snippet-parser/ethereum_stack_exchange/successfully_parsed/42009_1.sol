pragma solidity ^0.4.16;

import "./Set.sol";

contract d3 {
    Set.Data knownValues;

    function register(uint value) public {
        
        
        
        require(Set.insert(knownValues, value));
    }
    function contains(uint value) public returns (bool) {
        return Set.contains(knownValues, value);
    }
    
}
