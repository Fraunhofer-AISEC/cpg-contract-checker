interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns(address pair);
}

interface IUniswapV2Pair {
    function token0() external view returns(address);

    function token1() external view returns(address);

    function getReserves() external view returns(uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract myContract {
    
    address private _router = 0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff;

    
    IUniswapV2Router01 Router = IUniswapV2Router01(_router);


    
    address private _factory = Router.factory();
    IUniswapV2Factory Factory = IUniswapV2Factory(_factory);


    function getReserve(address _pairToken, address _token) public view onlyUsers returns(uint256[] memory reserves) {


        reserves[0] = 0; 
        reserves[1] = 0;

        
        address pair = Factory.getPair(_pairToken, _token);
        if (pair == address(0)) {
            return reserves;
        }
        
        IUniswapV2Pair PAIR = IUniswapV2Pair(pair);
        (uint256 res0, uint256 res1, ) = PAIR.getReserves();

        
        (uint256 pairRes, uint256 tokenRes) = _pairToken < _token ? (res0, res1) : (res1, res0);
        reserves[0] = pairRes;
        reserves[1] = tokenRes;
    }
}
