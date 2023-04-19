
pragma solidity ^0.8.0; 
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/lib/contracts/libraries/TransferHelper.sol";
import "@pancakeswap2/pancake-swap-core/contracts/interfaces/IPancakeFactory.sol";
import "@theanthill/pancake-swap-periphery/contracts/interfaces/IPancakeRouter02.sol";
interface IPancakeswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);
    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address); 
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);
    function createPair(address tokenA, address tokenB) external returns (address pair);
    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}
contract Tasse {
    address public pancakeSwapV2Pair;
    address public pancakeSwapV2Router;
    address public owner;
    uint256 public tokenFeePercent = 10;
    constructor() {
        owner = msg.sender;
        IPancakeSwapV2Router02 _pancakeSwapV2Router = IPancakeSwapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        IPancakeSwapV2Factory _pancakeSwapV2Factory = IPancakeSwapV2Factory(_pancakeSwapV2Router.factory());
        address _pancakeSwapV2Pair = _pancakeSwapV2Factory.createPair(address(this), _pancakeSwapV2Router.WETH());
        pancakeSwapV2Pair = _pancakeSwapV2Pair;
        pancakeSwapV2Router = address(_pancakeSwapV2Router);
    }
    function swapAndLiquify(uint256 tokenAmount) public {
        require(tokenAmount > 0, "Token amount must be greater than 0");
        IERC20 _token = IERC20(address(this));
        uint256 tokenBalance = _token.balanceOf(address(this));
        require(tokenBalance >= tokenAmount, "Insufficient token balance");
        uint256 tokenFee = (tokenAmount * tokenFeePercent) / 100;
        uint256 tokenToSwap = tokenAmount - tokenFee;
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = IPancakeSwapV2Router02(pancakeSwapV2Router).WETH();
        _token.approve(pancakeSwapV2Router, tokenToSwap);
        uint256 ethReceived = IPancakeSwapV2Router02(pancakeSwapV2Router).swapExactTokensForETH(
            tokenToSwap,
            0,
            path,
            address(this),
            block.timestamp
        )[1];
        uint256 tokenToLiquify = tokenFee + ((ethReceived * tokenFeePercent) / (100 - tokenFeePercent));
        _token.transfer(pancakeSwapV2Pair, tokenToLiquify);
        IPancakeSwapV2Router02(pancakeSwapV2Router).addLiquidityETH{value: ethReceived}(
            address(this),
            tokenToLiquify,
            0,
            0,
            owner,
            block.timestamp
        );
    }
}
