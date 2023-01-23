<!-- language: lang-solidity -->

pragma solidity ^0.6.0;

contract GasEstimation {

  event CorrectExecution(bool result, bool outOfGas);

  function callMe(address location) public payable {
    bool result = false;
    bool outOfGas = false;
    try ToBeCalled(location).externalCall() {
      result = true;
    } catch (bytes memory lowLevelData) {
      
    }
    if(result) {
      
      _inCaseOfSuccess();
    } else if(outOfGas) {
      revert("Out Of Gas!");
    }
    emit CorrectExecution(result, outOfGas);
  }

  function _inCaseOfSuccess() private {
    
  }
}

interface ToBeCalled {
  function externalCall() external;
}
