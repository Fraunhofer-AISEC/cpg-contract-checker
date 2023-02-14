pragma solidity ^0.6.0;

contract HelloWorld {
  function getContractAddress() public returns (address) {
    return address(this);
  }

  function getContractBalance() public view returns (uint256) {
    return address(this).balance;
  }
}
