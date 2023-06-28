pragma solidity ^0.4.15;

contract TestContract {

  uint public iD;
  bytes32 public name;
  function TestContract(uint _id, bytes32 _name) public {
    iD = _id;
    name = _name;
  }
}

contract Factory {

  TestContract myTest;
  TestContract testContract;
  function Factory () public {
    testContract = new TestContract(100,"0x123");
  }

  event LogData(uint _mydata, bytes32 _name);
  event LogAddress(address _add);
  function getContract() public {
    LogAddress(testContract);
    LogData(testContract.iD(), testContract.name());
  }
}
