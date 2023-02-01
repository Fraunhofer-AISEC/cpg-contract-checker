pragma solidity 0.4.24;
pragma experimental "ABIEncoderV2";

contract Conditional {
struct Condition {
    address to;
    bytes4 selector;
    bytes parameters;
    bytes32 expectedValueHash;
    bool onlyCheckForSuccess;
  }

 function isSatisfied(Condition memory condition)
    public
    view
    returns (bool)
  {
    if (condition.onlyCheckForSuccess) {
      return assertNotFails(condition);
    } else {
      return assertReturnsExpectedResult(condition);
    }
  }
}