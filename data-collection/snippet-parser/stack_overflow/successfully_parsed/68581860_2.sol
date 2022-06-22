 function addLiquidity(
        address routerAddress,
        address owner,
        uint256 tokenAmount,
        uint256 ethAmount) public {
        IPancakeRouter02 pancakeRouterz = IPancakeRouter02(routerAddress);
        
        
         IERC20(usdc).approve(routerAddress,tokenAmount);
         IERC20(usdc).transferFrom(msg.sender, address(this),tokenAmount);
         
        
        pancakeRouterz.addLiquidityETH{value : ethAmount}(
            usdc,
            tokenAmount,
            0, 
            0, 
            owner,
            block.timestamp + 360
        );
    }
