contract tokenA is ERC20 {
  constructor() ERC20('USDC Coin', 'USDC') {
    uint256 n = 1000;
    _mint(msg.sender, n * 10**uint(decimals()));

  }

contract tokenB is ERC20 {
  constructor() ERC20('WBTC Coin', 'WBTC') {
      uint256 n = 1000;
      _mint(msg.sender, n * 10**uint(decimals()));
  }
}
}
