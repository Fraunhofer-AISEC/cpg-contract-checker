contract LoanPool {
function flashLoan() external returns(bool){
    (bool success, ) = msg.sender.call(abi.encodeWithSignature("receiveCall()"));
    return success;
  }
}
