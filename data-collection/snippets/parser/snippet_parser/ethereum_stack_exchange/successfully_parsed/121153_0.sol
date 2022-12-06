 
function purchasingPower(address buyer) public view returns(uint256) {
    uint256 planetAmount = sprNft.balanceOf(buyer);

    uint256 bnbLiq = IERC20(pancakeRouter.WETH()).balanceOf(pancakePairAddress);
    uint256 sprLiq = IERC20(address(this)).balanceOf(pancakePairAddress);

    uint256 sprBnbCost = 0;
    unchecked { 
        sprBnbCost = (bnbLiq*(10**18) / sprLiq*(10**18));
    }
    
    IUniswapV2Factory factory = IUniswapV2Factory(pancakeRouter.factory());
    address bnbBusdPair = factory.getPair(pancakeRouter.WETH(), busdAddress);

    uint256 bnbBusdLiq = IERC20(pancakeRouter.WETH()).balanceOf(bnbBusdPair);
    uint256 busdLiq = IERC20(busdAddress).balanceOf(bnbBusdPair);
    
    uint256 bnbPrice = 0;
    uint256 sprUsdCost = 0;
    unchecked { 
        bnbPrice = (busdLiq * (10**18)/bnbBusdLiq * (10**18));
        sprUsdCost = (sprBnbCost * bnbPrice)/10**54;
    }

    uint256 multiplier = planetAmount;
    if (planetAmount < 1) {
        multiplier = 1;
    }

    uint256 tokAmount = 0;
    
    unchecked {
        tokAmount = ((maxUsdPurchasePerPlanetNft*multiplier)*10**18)/(sprUsdCost);
    }
    
    return tokAmount*(10**decimals);
}
