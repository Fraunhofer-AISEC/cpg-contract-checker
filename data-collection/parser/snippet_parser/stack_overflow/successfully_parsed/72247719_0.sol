
pragma solidity ^0.8.13;

interface YI{
  
  function hello() external payable;
}

contract X{
  YI public targetContract;
  constructor(address _target) {
    targetContract = YI(_target);
  }
}
