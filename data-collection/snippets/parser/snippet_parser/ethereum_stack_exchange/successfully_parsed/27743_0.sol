pragma solidity ^0.4.17;

contract someContract {
  function someContract(address _someAddress) public {
    uint someNumber = 1;
    if (_someAddress != 0x0000000000000000000000000000000000000000) {
      someContract dCA = someContract(_someAddress);
      if (dCA.getOne() != someNumber || dCA.getTwo() != 2) {
        revert();
      }
    }
  }

  function getOne() public pure returns (uint) {
      return 1;
  }

  function getTwo() public pure returns (uint) {
      return 2;
  }
}
