function cleanTheKingsChest() public isOwner {
  uint bal = address(this).balance;
  address(owner).transfer(bal);
}
