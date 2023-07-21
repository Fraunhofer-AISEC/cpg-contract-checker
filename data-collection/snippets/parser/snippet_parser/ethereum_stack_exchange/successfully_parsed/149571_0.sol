import "forge-std/Test.sol"

contract MyContract {
  function someFunction() public returns (bytes32) {
    return blockhash(block.number - 1); 
  }
}

contract TestMyContract is Test {
  MyContract myContract;

  function setUp() public {
    myContract = new MyContract();
  }

  function testResultChange() public {
    bytes32 firstResult = myContract.someFunction();

    

    bytes32 secondResult = myContract.someFunction();

    assertFalse(firstResult == secondResult);
  }
}
