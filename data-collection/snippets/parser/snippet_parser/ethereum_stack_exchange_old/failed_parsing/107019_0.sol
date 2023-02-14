pragma solidity =0.6.6;
import '@uniswap/v2-periphery/contracts/UniswapV2Router02.sol';
import "@openzeppelin/contracts/access/Ownable.sol";

contract Swap is UniswapV2Router02, Ownable {
   
   
 
    
   constructor() UniswapV2Router02(address _factory, address _WETH) public {
       
    }
    
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        override
        payable
        ensure(deadline)
        returns (uint[] memory amounts)
    {
        require(path[0] == WETH, 'UniswapV2Router: INVALID_PATH');
        amounts = UniswapV2Library.getAmountsIn(factory, amountOut, path);
        require(amounts[0] <= msg.value, 'UniswapV2Router: EXCESSIVE_INPUT_AMOUNT');
        IWETH(WETH).deposit{value: amounts[0]}();
        assert(IWETH(WETH).transfer(UniswapV2Library.pairFor(factory, path[0], path[1]), amounts[0]));
        _swap(amounts, path, to);
        
        if (msg.value > amounts[0]) TransferHelper.safeTransferETH(msg.sender, msg.value - amounts[0]);
    }
}```


Can someone please help so i can understand the basics more, as to where I am going wrong ??

Thanks & regards

Suveett kalra
