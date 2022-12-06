
pragma solidity ^0.8.11;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

interface IUniswapV2Router {
  function getAmountsOut(uint256 amountIn, address[] memory path)
    external
    view
    returns (uint256[] memory amounts);
  
  function swapExactTokensForTokens(
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
}

interface IUniswapV2Pair {
  function token0() external view returns (address);
  function token1() external view returns (address);
  function swap(
    uint256 amount0Out,
    uint256 amount1Out,
    address to,
    bytes calldata data
  ) external;
}


contract ArbitrageV1{
    event approve(uint256 buy1,uint256 _montant);
    event estimate(uint256 montan);
    address private constant routerPCS = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    address private constant wbnb1=0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;

    
    function swap(address _tokenIn, address _tokenOut, uint256 _amountIn, uint256 _amountOutMin, address _to) external {
        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
    
        IERC20(_tokenIn).approve(routerPCS, _amountIn);

        address[] memory path;
        if (_tokenIn == wbnb1 || _tokenOut == wbnb1) {
            path = new address[](2);
            path[0] = _tokenIn;
            path[1] = _tokenOut;
        } else {
            path = new address[](3);
            path[0] = _tokenIn;
            path[1] = wbnb1;
            path[2] = _tokenOut;
        }
        IUniswapV2Router(routerPCS).swapExactTokensForTokens(_amountIn, _amountOutMin, path, _to, block.timestamp);
    }receive() payable external {}
    
    function getAmountOutMin(address _tokenIn, address _tokenOut, uint256 _amountIn) external view returns (uint256) {
        address[] memory path;
        if (_tokenIn == wbnb1 || _tokenOut == wbnb1) {
            path = new address[](2);
            path[0] = _tokenIn;
            path[1] = _tokenOut;
        } else {
            path = new address[](3);
            path[0] = _tokenIn;
            path[1] = wbnb1;
            path[2] = _tokenOut;
        }
        uint256[] memory amountOutMins = IUniswapV2Router(routerPCS).getAmountsOut(_amountIn, path);
        return amountOutMins[path.length -1];
    } 
    }
