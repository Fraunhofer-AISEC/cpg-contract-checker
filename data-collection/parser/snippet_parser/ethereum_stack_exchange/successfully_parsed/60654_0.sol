pragma solidity ^0.4.23;

contract adding{

  uint256 public total;
  function  add(uint256 val1,uint256 val2) public returns(uint256){
    total = val1+val2;
    return total;
  }
}
