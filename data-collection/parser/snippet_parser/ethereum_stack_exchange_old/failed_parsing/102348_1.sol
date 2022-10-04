
import "./../interfaces/IUniswapV2Router.sol"; 

contract MyContract {

   address UNISWAP_V2_ROUTER = 0x....;

    function swap(...) external {
        uint[] memory out_amounts = IUniswapV2Router02(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
            amount, 
            minOut, 
            path, 
            beneficiary, 
            block.timestamp + 60 
        );

    }

}

