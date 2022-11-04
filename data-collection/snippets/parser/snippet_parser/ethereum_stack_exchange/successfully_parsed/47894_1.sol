pragma solidity ^0.4.23;

contract Test {

    function cond1() pure internal returns (bool) {
        
        uint[] memory array_a = new uint[](1);
        bytes32 hash1 = keccak256(array_a);
        array_a[0] = 42;
        bytes32 hash2 = keccak256(array_a);
        
        return hash1 != hash2;
    }

    function cond2() pure internal returns (bool) {
        
        uint[] memory array_a = new uint[](1);
        uint[] memory array_b = new uint[](1);
        array_a[0] = 42;
        array_b[0] = 42;
        
        return keccak256(array_a) == keccak256(array_b);
    }

    function cond3() pure internal returns (bool) {
        
        uint[] memory array_a = new uint[](1);
        uint[] memory array_b = new uint[](2);
        
        return keccak256(array_a) != keccak256(array_b);
    }

    function cond4() pure internal returns (bool) {
        
        uint[] memory array_a = new uint[](2);
        uint[] memory array_b = new uint[](2);
        array_a[0] = 42; array_a[1] = 17;
        array_b[0] = 17; array_a[1] = 42;
        
        return keccak256(array_a) != keccak256(array_b);
    }

    function testConditions() pure public returns (bool) {
        return cond1() && cond2() && cond3() && cond4();
    }
}
