   function getTokenPriceAB(address pairAddress) public view returns(uint256) {

        IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
        uint256 price = pair.kLast();
        return price;

    }
