function payment (address payable beneficiary) payable external{
  uint256 amount = msg.value;
  beneficiary.transfer(amount);
}
