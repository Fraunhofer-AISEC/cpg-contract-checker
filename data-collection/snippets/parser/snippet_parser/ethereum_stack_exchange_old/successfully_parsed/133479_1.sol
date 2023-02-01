pragma solidity >=0.8.13;

contract ExternalPublicTest {
    function foo(uint[20] memory a) public pure returns (uint){
         return a[10]*2;
    }

    function bar(uint[20] calldata a) external pure returns (uint){
         return a[10]*2;
    }    
}
