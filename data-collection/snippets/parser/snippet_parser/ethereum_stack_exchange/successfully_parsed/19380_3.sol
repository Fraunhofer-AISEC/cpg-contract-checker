

pragma solidity 0.8.4;

contract ExternalPublicTest {
    function test(uint[20] memory a) public pure returns (uint){
         return a[10]*2;
    }

    function test2(uint[20] calldata a) public pure returns (uint){
         return a[10]*2;
    }    
}
