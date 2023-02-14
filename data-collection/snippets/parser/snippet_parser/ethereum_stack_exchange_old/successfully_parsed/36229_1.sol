pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract Test {

    struct Bar {
        uint a;
        uint b;
    }

    Bar public z;
    string public y;

    function foo(string s, Bar b) public {
        y = s;
    }

}
