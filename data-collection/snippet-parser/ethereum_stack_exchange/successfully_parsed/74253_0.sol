pragma solidity ^0.5.1;

contract Student { 
    bytes32[32] parameters; 
    function setParameters(bytes32[] memory _parameters) public { 
        for (uint i = 0; i < _parameters.length; i++) { 
            parameters[i] = _parameters[i];
        } 
    }
}
