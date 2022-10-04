event LogSelfDestruct(address sender, uint amount);

function kill() public onlyOwner {
  LogSelfDestruct(msg.sender, this.balance);
  selfdestruct(owner);
}
