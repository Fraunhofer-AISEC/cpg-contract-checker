function ownerDebit(uint amount) public payable onlyOwner returns(bool status){
  status = owner.send(amount);
  return status;
}
