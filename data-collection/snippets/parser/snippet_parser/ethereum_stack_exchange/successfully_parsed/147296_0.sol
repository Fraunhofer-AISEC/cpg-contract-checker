    constructor (uint160 sqrtPriceX96_) {
        _rOwned[_msgSender()] = _rTotal;
        _ISwapRouter = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
        _IUniswapV3Factory = IUniswapV3Factory(0x1F98431c8aD98523631AE4a59f267346ea31F984); 
        _IPoolInitializer = IPoolInitializer(0xC36442b4a4522E871399CD717aBDD847Ab11FE88); 
        WETH = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6; 
        _INonfungiblepositionmanager = INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88); 
        addressThis = address(this);
        token0 = addressThis;
        token1 = WETH; 
        fee = 3000;
        _sqrtPriceX96 = sqrtPriceX96_;    

        poolAddress = _IUniswapV3Factory.getPool(token0, token1, fee);
        if (poolAddress == address(0)) {
            if(token0 > token1){
                address temp = token0;
                token0 = token1;
                token1 = temp;
            }
            _IPoolInitializer.createAndInitializePoolIfNecessary(token0, token1, fee, _sqrtPriceX96);
        }
        
        
        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[addressThis] = true;
        
        emit Transfer(address(0), _msgSender(), _tTotal);
    }
   
