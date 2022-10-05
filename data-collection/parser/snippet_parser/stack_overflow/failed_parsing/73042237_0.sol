address payable public coldStorage;
event toColdStorage (address from, uint256 amount, uint toBlockchain, string toAddress);
event removedFromColdStorage (address to, uint256 amount, uint fromBlockchain, string fromAddress);

function getFromStorage(address payable _to, uint _fromBlockchain, string memory _fromAddress) public payable {
    require(msg.sender == coldStorage, "Only the owners can call this function");
    _to.transfer(msg.value);
    emit removedFromColdStorage(_to, msg.value, _fromBlockchain, _fromAddress);
  }
