pragma solidity ^0.5.0;


contract Contract {

    struct Everything {
        uint a;
        bytes32 b;
        bool c;
        address d;
    }

    Everything[] public my_array;

    function expand() public {
        my_array.length++;
    }
}
