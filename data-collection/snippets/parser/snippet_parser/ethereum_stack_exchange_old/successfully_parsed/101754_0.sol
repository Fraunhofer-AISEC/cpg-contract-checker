contract Strategy is ReentrancyGuard {
  IERC20 private  paymentToken;
  Token private  strategyToken;

  constructor(IERC20 _paymentToken, Token _strategyToken) {
    paymentToken = _paymentToken;
    strategyToken = _strategyToken;
  }

  function deposit(uint256 amount) external payable nonReentrant {
    
    paymentToken.transferFrom(msg.sender, address(this), amount);
  }
}
