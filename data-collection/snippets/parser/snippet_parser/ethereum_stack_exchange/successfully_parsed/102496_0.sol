constructor () public {
        _rOwned[_msgSender()] = _rTotal;
        
        
        
        
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);
        
        
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());

        
        uniswapV2Router = _uniswapV2Router;
        
        
        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;
        
        
        excludeFromReward(owner());
        excludeFromReward(0x000000000000000000000000000000000000dEaD);
        excludeFromReward(0x0000000000000000000000000000000000000001);
        
        emit Transfer(address(0), _msgSender(), _tTotal);
    }
