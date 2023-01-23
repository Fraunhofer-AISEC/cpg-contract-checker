contract TestLiquidity {

  address private constant ROUTER = 0xeEea9fc1B8c453105258F09BCa4d06086a909c91;
  event Log(string message, uint val);

  function addLiquidity(
    address _tokenA,
    address _tokenB,
    uint _amountA,
    uint _amountB
  ) external {
    IERC20(_tokenA).transferFrom(msg.sender, address(this), _amountA);
    IERC20(_tokenB).transferFrom(msg.sender, address(this), _amountB);
    IERC20(_tokenA).approve(ROUTER, _amountA);
    IERC20(_tokenB).approve(ROUTER, _amountB);
    

    (uint amountA, uint amountB, uint liquidity) =
      IUniswapV2Router02(ROUTER).addLiquidity(
        _tokenA,
        _tokenB,
        _amountA,
        _amountB,
        1,
        1,
        address(this),
        block.timestamp
      );

    emit Log("amountA", amountA);
    emit Log("amountB", amountB);
    emit Log("liquidity", liquidity);
  }


}
