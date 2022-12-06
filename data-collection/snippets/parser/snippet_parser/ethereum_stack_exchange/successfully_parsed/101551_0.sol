contract USDTStrategy is ICoinYield, ReentrancyGuard {
  address private constant USDT_ADDRESS = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  IERC20 private constant _usdt = IERC20(USDT_ADDRESS);
  CYUSDTToken private immutable _cyusdt = new CYUSDTToken();
  
  function deposit(uint256 amount) override external payable nonReentrant {
    
    _usdt.transferFrom(msg.sender, address(this), amount);

    
    _cyusdt.mint(msg.sender, amount);
  }
}
