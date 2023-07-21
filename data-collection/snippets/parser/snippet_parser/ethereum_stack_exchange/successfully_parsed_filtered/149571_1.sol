
contract TestMyContract is Test {
  MyContract myContract;

  bytes32 lastResult;

  function setUp() public {
    myContract = new MyContract();
  }

  function testRecordResult() public {
    lastResult = myContract.someFunction();
  }

  function testResultChange() public {
    bytes32 newResult = myContract.someFunction();

    assertFalse(newResult == lastResult, "Value haven't changed");
  }
}
