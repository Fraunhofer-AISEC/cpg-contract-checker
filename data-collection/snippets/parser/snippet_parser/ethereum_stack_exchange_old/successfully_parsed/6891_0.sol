pragma solidity 0.4.25; 

contract Cast {

    uint n;
    string s;
    address a;

    function convert() public view {
        bytes32 b1 = bytes32(n);
        bytes32 b2 = bytes32(a);
        bytes32 b4 = bytes32("string");
        bytes memory b5 = bytes(s);
    }
}
