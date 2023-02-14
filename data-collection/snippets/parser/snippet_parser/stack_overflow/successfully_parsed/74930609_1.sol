pragma solidity ^0.8;

contract MyContract {
  uint256 number;

  fallback() external payable {
    number = 1;
  }
}

contract Sender {
  address myContract;

  constructor(address _myContract) {
    myContract = _myContract;
  }

  function invokeFallback() external {
    payable(myContract).transfer(0);
  } 
}
