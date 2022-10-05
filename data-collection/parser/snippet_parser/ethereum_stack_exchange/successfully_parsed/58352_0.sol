pragma solidity ^0.4.24;

contract Foo {
    uint256 n = 10;
    function initArray() public view  {
        uint[10*10] memory result;
        for (uint i = 0; i < n; i++){
           for(uint j = 0; j < n; j++){
                result[(i*9)+j]=1; 
            }
        }

    }
}
