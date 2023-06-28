pragma solidity >=0.7.1;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";

contract PancakeProxyContract {
    address WBNB = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;
    address internal constant addr = 0xD99D1c33F9fC3444f8101754aBC46c52416550D1;
    IUniswapV2Router02 public uniswapRouter;

    constructor() {
        uniswapRouter = IUniswapV2Router02(addr);
    }

    function EthToTokens(uint amountOutMin, address[] memory path,uint deadline) public payable {
        uniswapRouter.swapExactETHForTokens{ value: msg.value }(amountOutMin, path, address(this), deadline);
        
        (bool success,) = msg.sender.call{ value: address(this).balance }("");
        require(success, "refund failed");
    }


    receive() payable external {}
}
