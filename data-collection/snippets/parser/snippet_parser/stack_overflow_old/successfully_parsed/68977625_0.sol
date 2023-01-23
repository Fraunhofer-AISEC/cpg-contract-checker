function _mintFee(uint112 _reserve0, uint112 _reserve1) private returns (bool feeOn) {
        address feeTo = IFactory(factory).feeTo();
        feeOn = feeTo != address(0);
        uint _kLast = kLast; 
        if (feeOn) {
            if (_kLast != 0) {
                uint rootK = Math.sqrt(uint(_reserve0) * (_reserve1));
                uint rootKLast = Math.sqrt(_kLast);
                if (rootK > rootKLast) { 
                    uint numerator = totalSupply * (rootK - (rootKLast));
                    uint denominator = rootK * (5) + (rootKLast);
                    uint liquidity = numerator / denominator;
                    if (liquidity > 0) _mint(feeTo, liquidity);
                }
            }
        } else if (_kLast != 0) {
            kLast = 0;
        }
    }

    
function mint(address to) public lock returns (uint liquidity) {
     (uint112 _reserve0, uint112 _reserve1,) = getReserves(); 
    uint balance0 = IERC20(token0).balanceOf(address(this));
    uint balance1 = IERC20(token1).balanceOf(address(this));
    uint amount0 = balance0 - _reserve0;
    uint amount1 = balance1 - _reserve1;
    bool feeOn = _mintFee(_reserve0, _reserve1);
    uint _totalSupply = totalSupply; 
    if (_totalSupply == 0) {
        liquidity = Math.sqrt(amount0 * amount1) - (MINIMUM_LIQUIDITY);
       _mint(address(0), MINIMUM_LIQUIDITY); 
    } else {
        liquidity = Math.min(amount0 * (_totalSupply) / _reserve0, amount1 * (_totalSupply) / _reserve1);
    }
    require(liquidity > 0, 'mint: INSUFFICIENT_LIQUIDITY_MINTED');
    _mint(to, liquidity);
    _update(balance0, balance1, _reserve0, _reserve1);
    if (feeOn) kLast = uint(reserve0) * (reserve1); 
    emit Mint(msg.sender, amount0, amount1);
}
