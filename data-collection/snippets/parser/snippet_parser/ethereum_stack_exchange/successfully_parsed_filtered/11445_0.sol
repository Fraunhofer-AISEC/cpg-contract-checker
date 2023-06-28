contract owned { 
  address  public owner;
  function owned() {
    owner = msg.sender;
  }
  function ownerOnly() {
    if (msg.sender != owner) throw;
  }
  modifier onlyOwner {
    if (msg.sender != owner) throw;
       _
  }
  function transferOwnership(address newOwner) onlyOwner {
    owner = newOwner;
  }
}
