pragma solidity ^0.4.0;

contract test_compexity{


 function f(uint256 n) constant  returns (uint256)  {
    uint256 j=0;
     while(j<n){
         j=j+1;
     }

 return j;
 }
}
