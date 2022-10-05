pragma solidity ^0.4.24;

contract Foo {
    uint256 n = 10;
    function initArray(uint k,uint l) public view returns(uint)  {
        uint[][] memory arr = new uint[][](n);
        for (uint i=0; i < n; i++) {
            uint[] memory temp = new uint[](n);
            for(uint j = 0; j < n; j++){
                    temp[j]=i+j; 
                }
            arr[i] = temp;
        }
        
        return arr[k][l];
    }
}
