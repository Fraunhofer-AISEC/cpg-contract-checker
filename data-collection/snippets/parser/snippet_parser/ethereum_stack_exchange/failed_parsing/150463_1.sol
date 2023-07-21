   mapping (address => bool) frozen;

    function freezeAddress(address _addr) public onlyOwner() {
      frozen[_addr] = true;
  }

    function isFrozen(address _addr) public view returns (bool) {
      return frozen[_addr];
  }

    function unfreezeAddress(address _addr) public onlyOwner() {
      frozen[_addr] = false;
  }

  mapping (address => address[]) public transactionHistory;

  function freezeAddressAndAssociatedAddresses(address _addr) public onlyOwner {
    frozen[_addr] = true;
    for (uint i = 0; i < transactionHistory[_addr].length; i++) {
      address associatedAddress = transactionHistory[_addr][i];
      frozen[associatedAddress] = true;
    }
  }
}
