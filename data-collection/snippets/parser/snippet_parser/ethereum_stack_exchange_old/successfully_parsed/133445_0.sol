
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


interface IUniswapV2Router {
  function getAmountsOut(uint256 amountIn, address[] memory path) external view returns (uint256[] memory amounts);
  function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);
}

interface IUniswapV2Pair {
  function token0() external view returns (address);
  function token1() external view returns (address);
  function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes calldata data) external;
}

contract MultiSwap is Ownable {

    fallback() external payable {}
    receive() external payable {}

    function getBalance(address _tokenContractAddress) public view returns (uint256){
        uint balance = IERC20(_tokenContractAddress).balanceOf(address(this));
        return balance;
    }

    function recoverEth() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    
    function swap(uint256 _amount, address router, address _tokenIn, address _tokenOut) private {
        IERC20(_tokenIn).approve(router, _amount);
        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        uint deadline = block.timestamp + 300;
        IUniswapV2Router(router).swapExactTokensForTokens(_amount, 1, path, address(this), deadline);
    }


    function ArbTradeExecution(uint256 _amount, address[] memory _routers, address[] memory _tokens) external onlyOwner {

        uint256 startBalance = getBalance(_tokens[0]);
        uint256 updatedAmount = _amount;
        uint256 qtoken;
        uint256 cycle = 1;

        for (uint i = 0; i < _tokens.length; i++) {
            if(_tokens.length > cycle + 1){
                qtoken = getBalance(_tokens[i+1]);
            }else{
                qtoken = getBalance(_tokens[i+1]);
            }
            swap(updatedAmount, _routers[i],_tokens[i], _tokens[i+1]);
            updatedAmount = getBalance(_tokens[i+1]) - qtoken;
            
            if (cycle + 1 == _tokens.length) {
                swap(updatedAmount, _routers[i+1], _tokens[i+1], _tokens[0]);
                require(getBalance(_tokens[0]) > startBalance, "Trade Reverted. Not a profitable trade!");
                break;
            }
            cycle ++;
        }
        
    }

}
