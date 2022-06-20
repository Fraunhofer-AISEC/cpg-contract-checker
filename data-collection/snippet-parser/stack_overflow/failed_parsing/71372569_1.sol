contract Lib_UniswapV3
{
    ...
    struct PopulatedTick {
        int24 tick;
        int128 liquidityNet;
        uint128 liquidityGross;        
    }
}

abstract contract UniswapV3TickLens is Lib_UniswapV3
{
    function getPopulatedTicksInWord(address poolAddress, int16 tickBitmapIndex) external virtual returns (PopulatedTick[] memory);
}

contract ContractB is
    Lib_UniswapV3   
{

    function getExchangePriceInputData(
        address poolAddress
        )         
        public  
        returns (PriceInputData[] memory priceInputData)
        {   
            ...
            PopulatedTick[] memory ticks;
            (ticks) = UniswapV3TickLens(0xbfd8137f7d1516D3ea5cA83523914859ec47F573).getPopulatedTicksInWord(address(0x8ad599c3A0ff1De082011EFDDc58f1908eb6e6D8), int16(12));        
            ...

        }
}
