

pragma solidity 0.8.15;

import "./ERC20/ERC20.sol";
import "./access/Ownable.sol";
import "./uniswap/IUniswapV2Router02.sol";

contract MyxyzToken is ERC20, Ownable {

    IUniswapV2Router02 public uniswapV2Router;
    uint256 private buyMarketingFee;
    uint256 private sellMarketingFee;

    constructor() ERC20("MyxyzToken", "Myx") {
        uint256 totalsupply = 100_000_000  (10*18);
        uniswapV2Router = IUniswapV2Router02(
            0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
        );
        address uniswapV2Pair = address(0x0); 
        address marketingWallet = address(0x0); 
        buyMarketingFee = 2;
        sellMarketingFee = 2;
        _mint(owner(), total_supply);
    }

    function _transfer(address from, address to, uint256 amount) internal override {

      require(from != address(0), "zero address");
      require(to != address(0), "zero address");

      uint256 fromBalance = _balances[from];
       require(fromBalance >= amount, "transfer amount exceeds balance");

      
      if (uniswapV2Pair == from) {
        if (buyMarketingFee > 0) {
            
            uint256 fee = (amount * buyMarketingFee) / 100;
            _balances[marketingWallet] = _balances[marketingWallet] + fee;
        }
      }
      
      else if (uniswapV2Pair == to) {
        if (sellMarketingFee > 0) {
            
            uint256 fee = (amount * sellMarketingFee) / 100;
            _balances[marketingWallet] = _balances[marketingWallet] + fee;
        }
      }
      uint256 amountReceived = amount - fee;
      unchecked {
        _balances[from] = fromBalance - amount; 
        _balances[to] += amountReceived;
      }
  }

}
