contract 2omo is Context, IERC20, Ownable {

    using SafeMath for uint256;

    IUniswapV2Router02 private _uniswapV2Router;

    IERC20 private WrappedETH;
