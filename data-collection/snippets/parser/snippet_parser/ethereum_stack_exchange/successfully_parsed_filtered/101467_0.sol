  function deposit(uint256 amount) override external payable {
    IERC20 usdt = IERC20(msg.sender);
    MyToken token = new MyToken();

    
    usdt.transferFrom(msg.sender, address(this), amount);

    
    token.transfer(msg.sender, amount);
  }
