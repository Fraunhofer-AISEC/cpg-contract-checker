
pragma solidity ^0.7.0;

contract swapTest{
    
    address private constant pancakeRouter = 0x05fF2B0DB69458A0750badebc4f9e13aDd608C7F;
    address private constant WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
 

    function swap(
        uint amountOutMin,
        address token
        ) external payable {
            IERC20(WBNB).transferFrom(msg.sender, address(this), msg.value);
            IERC20(WBNB).approve(pancakeRouter, msg.value);
            address[] memory path = new address[](2);
            path[0] = WBNB;
            path[1] = token;
            IPancakeRouter02(pancakeRouter).swapExactETHForTokens{value: msg.value}(
                amountOutMin,
                path,
                msg.sender,
                block.timestamp
        );
    }
}
