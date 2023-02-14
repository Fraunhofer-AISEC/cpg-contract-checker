contract tokenSwap {
    

    address private constant FGD = 0xB86a03eF847d462E40D853c015260C55Cfac9DAD;
    address private constant FACTORY = 0xB7926C0430Afb07AA7DEfDE6DA862aE0Bde767bc;
    address private constant admin = 0x567A623433D503183Fb383493FdB12A4780e2F60;
    address private constant BUSD = 0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7;
    address private constant DAI = 0x8a9424745056Eb399FD19a0EC26A14316684e274;
    address private constant cake = 0xF9f93cF501BFaDB6494589Cb4b4C15dE49E85D0e;     
    address private owner;
    address private constant Pancakeswap_V2_ROUTER = 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3;
    address private constant WETH = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;
    function swap_first( address _tokenOut, uint256 _amountIn, uint256 _amountOutMin) external {
    
    address _tokenIn = WETH;
    IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
    
    IERC20(_tokenIn).approve(Pancakeswap_V2_ROUTER, _amountIn);

    address[] memory path;
    if (_tokenIn == WETH || _tokenOut == WETH) {
      path = new address[](2);
      path[0] = _tokenIn;
      path[1] = _tokenOut;
    } else {
      path = new address[](3);
      path[0] = _tokenIn;
      path[1] = WETH;
      path[2] = _tokenOut;
    }
        IPancakeswapV2Router(Pancakeswap_V2_ROUTER).swapExactTokensForTokens(_amountIn, _amountOutMin, path, address(this), block.timestamp);
    }
}