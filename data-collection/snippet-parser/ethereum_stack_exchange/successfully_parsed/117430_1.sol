function getReserves() public view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) {
            _reserve0 = token0.balanceOf(this);
            _reserve1 = token1.balanceOf(this);
            _blockTimestampLast = blockTimestampLast;
        }
