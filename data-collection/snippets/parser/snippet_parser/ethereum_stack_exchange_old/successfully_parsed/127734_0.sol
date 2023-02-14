function foobar() payable external {
  
  
  uint256 requiredEther = _requiredEther();
  require(msg.value >= requiredEther, "msg.value too low");

  
  
  
  
  if (msg.value > requiredEther) {
    (bool success, ) = payable(msg.sender).call(){value: msg.value-requiredEther};
    require(success, "Reimbursement failed");
  }
}
