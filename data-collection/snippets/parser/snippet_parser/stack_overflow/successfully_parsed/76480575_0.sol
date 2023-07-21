modifier notContract() {
    require(!_isContract(msg.sender), "Contract not allowed");
    require(msg.sender == tx.origin, "Proxy contract not allowed");
    _;
  }
