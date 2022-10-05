pragma solidity 0.8.0;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";


contract test {

address internal owner;
address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D ;
IUniswapV2Router02 private uniswapRouter;

constructor() {
    uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
    owner = msg.sender; 
    }


modifier isOwner(){
    require(msg.sender == owner, "Caller is not owner");
    _;
    }
    
    
function EthToTokens(address tokenAddress, uint EthInAmount, uint TokenOutAmountMin, uint deadline) public payable {
    uniswapRouter.swapExactETHForTokens{ value: EthInAmount }(TokenOutAmountMin, getPathForEthToToken(tokenAddress), address(this), deadline);
    }

function TokensToEth(address tokenAddress, uint EthOutAmount, uint TokenInAmount, uint deadline) public payable {
    IERC20 token = IERC20(tokenAddress);
    token.approve(UNISWAP_ROUTER_ADDRESS, TokenInAmount);
    uniswapRouter.swapExactTokensForETH(TokenInAmount, EthOutAmount, getPathForTokenToEth(tokenAddress), address(this), deadline);
    }

function getPathForEthToToken(address tokenAddress) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = uniswapRouter.WETH();
    path[1] = tokenAddress;
    return path;
    }    
    
function getPathForTokenToEth(address tokenAddress) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = tokenAddress;
    path[1] = uniswapRouter.WETH();
    return path;
    }

function sendEther() public payable{
}

function withdraw(address payable _address, uint withdrawAmount) public payable isOwner{
    _address.transfer(withdrawAmount);
}

}
