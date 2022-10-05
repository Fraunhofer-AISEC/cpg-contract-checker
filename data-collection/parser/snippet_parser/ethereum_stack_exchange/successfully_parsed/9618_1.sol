pragma solidity ^0.4.3;

contract Test {
    function getData() constant returns (bytes32, bytes32, bytes32, bytes32,
                                     bytes32, bytes32, bytes32, bytes32,
                                     bytes32, bytes32, bytes32, bytes32,
                                     bytes32, bytes32, bytes32) {                                         

        return ("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o");                                         
    }
}
