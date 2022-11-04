pragma solidity ^0.8.8;

interface ContractInterface {
  function transfer(address to, uint256 value) external returns (bool success);
}
