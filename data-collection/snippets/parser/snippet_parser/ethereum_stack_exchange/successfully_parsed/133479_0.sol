pragma solidity^0.4.12;

contract Test {
    function test(uint[20] a) public returns (uint){
         return a[10]*2;
    }

    function test2(uint[20] a) external returns (uint){
         return a[10]*2;
    }
}
