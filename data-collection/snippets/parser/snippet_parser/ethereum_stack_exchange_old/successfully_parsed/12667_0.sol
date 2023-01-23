pragma solidity ^0.4.0;
contract Contract {
    function hashIt(string a, uint b) returns(bytes32){
        return sha3(a, b);
    }
}
