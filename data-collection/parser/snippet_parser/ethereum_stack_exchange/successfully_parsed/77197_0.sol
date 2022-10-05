function deposit(uint amount) public {
    require(daitoken.transferFrom(msg.sender, address(this), amount), 'transferFrom failed');
    emit Transfer(msg.sender, address(this), amount);
    require(ldai.mint(msg.sender, amount), 'mint failed');
    emit Mint(msg.sender, amount);
    emit Deposit(msg.sender, amount);
  }
