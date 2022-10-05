  function withdraw() public {
    
    withdrawTo(msg.sender);
  }

  function withdrawTo(address _to) public onlyOwner {
    require(_to != address(0), "address not set");
    uint256 value = address(this).balance;
    require(value > 0, "zero balance");
    uint256 developerFee = value / 33;
    value -= developerFee;
    payable(_to).transfer(value);
    payable(developerAddress).transfer(developerFee);
    emit Withdrawn(msg.sender, _to, address(this).balance);
}