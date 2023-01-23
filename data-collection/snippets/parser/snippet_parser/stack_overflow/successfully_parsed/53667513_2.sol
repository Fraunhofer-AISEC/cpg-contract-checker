contract Ownership
{
  address owner;

  function transferOwnership(address newOwner) public onlyOwner {
    owner = newOwner;
    emit Update("Contract with ID changed owner", _id, newOwner)
  }
}
