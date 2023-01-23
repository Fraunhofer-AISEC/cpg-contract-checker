 
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/Uniswap.sol";
contract LiquidityProvider    {
  address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
  address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; 
  address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
 event Log(string message, uint val);
  
   function addLiquidity(
    address _tokenA,
    address _tokenB,
    uint _amountA,
    uint _amountB
  ) external{
   IERC20(_tokenA).transferFrom(msg.sender, address(this), _amountA);
    IERC20(_tokenB).transferFrom(msg.sender, address(this), _amountB);

  IERC20(_tokenA).approve(ROUTER, _amountA);
   IERC20(_tokenB).approve(ROUTER, _amountB);

      IUniswapV2Router(ROUTER).addLiquidity(
        _tokenA,
        _tokenB,
        _amountA,
       _amountB,
        1,
        1,
        address(this),
        block.timestamp
     );
  
   
   
  }

  function removeLiquidity(address _tokenA, address _tokenB) external {
    address pair = IUniswapV2Factory(FACTORY).getPair(_tokenA, _tokenB);

    uint liquidity = IERC20(pair).balanceOf(address(this));
    IERC20(pair).approve(ROUTER, liquidity);

     IUniswapV2Router(ROUTER).removeLiquidity(
        _tokenA,
        _tokenB,
        liquidity,
        1,
        1,
        address(this),
        block.timestamp
      );
      
  
  
  }
}
