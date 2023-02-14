    function pancakeCall(address _sender,uint256 _amount0,uint256 _amount1,bytes calldata _data) external {


    address token0 = IUniswapV2Pair(msg.sender).token0();
    address token1 = IUniswapV2Pair(msg.sender).token1();
    address pair = IUniswapV2Factory(PANCAKE_FACTORY).getPair(token0,token1);

    require(msg.sender == pair, "The sender needs to match the pair");
    require(_sender == address(this), "Sender should match this contract");

    (address starterToken, address tokenLink1, address tokenLink2,  uint256 amount, address myAddress) = abi.decode(_data,(address, address, address, uint256, address));


    uint256 fee = ((amount * 3) / 997) + 1;
    uint256 amountToRepay = amount + fee;

    uint256 loanAmount = _amount0 > 0 ? _amount0 : _amount1;

    uint256 trade1AcquiredCoin = placeTrade(starterToken, tokenLink1, loanAmount);
