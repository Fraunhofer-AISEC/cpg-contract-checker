pragma solidity >=0.5.0; 

import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/ISwapRouter.sol";
import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/IQuoter.sol";
import "https://github.com/Uniswap/v3-core/blob/main/contracts/interfaces/IUniswapV3Pool.sol";
import "https://github.com/Uniswap/v3-core/blob/main/contracts/interfaces/IUniswapV3Factory.sol";

contract FactoryConsts {
    IQuoter public constant uniswapQuoter = IQuoter(0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6);
    IUniswapV3Factory public constant uniFactory = IUniswapV3Factory(0x1F98431c8aD98523631AE4a59f267346ea31F984);
}

contract Swap is FactoryConsts {
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    
    function getPoolAddress() external view returns (address) {
        address pool = uniFactory.getPool(DAI, WETH, 3000);
        return pool;
    }
}
