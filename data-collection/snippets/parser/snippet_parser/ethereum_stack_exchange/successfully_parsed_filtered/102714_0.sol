function getPoolPair() public view returns (address) {
    return IPancakeFactory( pancakeRouter.factory() ).getPair( address(this), pancakeRouter.WETH() );
}


function getPoolLiquidityInBNB() public view returns(uint256){
    return IERC20( getPoolPair() ).balanceOf( address(this) );
}

function addBalanceToLiquidity() public {
    approve( address(this), routerAddress, 1000 );
    
    pancakeRouter.addLiquidityETH{value : address(this).balance}(
        address(this),
        1000,
        0, 
        0, 
        address(this),
        block.timestamp + 360
    );
    
}

function removeLiquidity() public onlyOwner {
    
    uint256 poolLiquidity = getPoolLiquidityInBNB();
    
    approve( routerAddress,  getPoolPair(), poolLiquidity );
    
    pancakeRouter.removeLiquidityETH(
        address(this),
        poolLiquidity,
        0,
        0,
        address(this),
        block.timestamp + 360        
    );
}
