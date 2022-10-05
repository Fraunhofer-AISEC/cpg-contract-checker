pragma solidity 0.5.16;

contract NullVals {

    struct Test {
        address a;
        uint256 b;
        bytes32 c;
        address d;
    }

    mapping(bytes32 => Test) public tests;

    function silentSetter(bytes32 key, address a) public {
        Test storage t = tests[key];
        t.a = a;
    }

}
