pragma solidity ^0.6.2;

interface IUniswap {
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function WETH() external pure returns (address);
}

contract MyDefi{
    
    IUniswap uniswap;
    
    constructor(address _uniswap) public {
        uniswap = IUniswap(_uniswap);
    }

    function tastSwapExactETHForTokens(
        uint amountOut,
        address token,
        uint deadline
    ) external payable {
        address[] memory path = new address[](2);
        path[0] = uniswap.WETH();
        path[1] = token;
        uniswap.swapExactETHForTokens(
            amountOut,
            path,
            msg.sender,
            deadline
        );
    }
  
}
