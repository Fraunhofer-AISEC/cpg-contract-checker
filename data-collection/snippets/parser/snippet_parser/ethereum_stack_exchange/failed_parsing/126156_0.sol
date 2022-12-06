IUniswapV2Pair pair = IUniswapV2Pair(0x000...some address....0000);
uint256 price=pair.price0CumulativeLast();
if (price>0) { this is a real LP... }
