  function purchase(address from, uint tokensPaid) public {
    require(msg.sender == address(this), "wrong sender");
    emit PurchaseMade(from, tokensPaid);
  }
