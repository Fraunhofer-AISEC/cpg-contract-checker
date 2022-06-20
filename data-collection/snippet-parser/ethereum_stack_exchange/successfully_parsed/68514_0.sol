function kill() public onlyOwner returns (bool) {
  selfdestruct(msg.sender);     
  return true;
}
