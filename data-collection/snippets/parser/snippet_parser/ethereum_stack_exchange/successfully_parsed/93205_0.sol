pragma solidity ^0.6.8;


contract C {
    function test3(uint f) external  returns(uint256[3] memory) {
        uint256[3] memory arr;
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        return arr;
    }
}


contract A {

    function test(C addr) external returns(uint) {
        uint256[3] memory  z =addr.test3(31);
        return z[0] + z[1] + z[2];
    }
    
}
