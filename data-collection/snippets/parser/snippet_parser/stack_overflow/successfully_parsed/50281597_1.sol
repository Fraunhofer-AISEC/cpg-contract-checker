pragma solidity ^0.4.19;

contract Names {
    bytes32[] public names;
    
    function Names(bytes32[] _names) public {
        names = _names;
    }
    
    function get(uint i) public constant returns (bytes32) {
        return names[i];
    }
}
