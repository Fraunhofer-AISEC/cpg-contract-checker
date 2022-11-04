pragma solidity ^0.4.23;

contract adding{

  function  add(uint256 val1,uint256 val2) public pure  returns(uint256){
    
    uint256 total = val1+val2;
    return total;
  }
}
