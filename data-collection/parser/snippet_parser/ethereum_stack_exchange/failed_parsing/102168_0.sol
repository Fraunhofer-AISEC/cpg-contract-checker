contract Strategy is ReentrancyGuard {
  IERC20 private immutable paymentToken;
  Token private immutable strategyToken;

  constructor(IERC20 _paymentToken, Token _strategyToken) {
    paymentToken = _paymentToken;
    strategyToken = _strategyToken;
  }

  
  function deposit(uint256 amount) external payable nonReentrant {
    
    paymentToken.transferFrom(msg.sender, address of exchange, amount);

    
    strategyToken.mint(msg.sender, amount);
  }
}
