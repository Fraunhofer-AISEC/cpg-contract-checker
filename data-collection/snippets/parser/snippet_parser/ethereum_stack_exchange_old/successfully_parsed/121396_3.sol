
pragma solidity ^0.8.0;

contract Balance {

  function balance() public returns (uint256){
    return payable(address(this)).balance;
  }
}
