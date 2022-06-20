pragma solidity ^0.7.4;

contract ExternalPublicTest {
    function test(uint[20] memory a) public pure returns (uint){
         return a[10]*2;
    }

    function test2(uint[20] calldata a) external pure returns (uint){
         return a[10]*2;
    }    
}
