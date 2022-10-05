pragma solidity = 0.7.6;
import './../v3-core/contracts/UniswapV3Factory.sol';

contract TopLevelContract {

    UniswapV3Factory public factory;
    
    constructor() {
        factory = new UniswapV3Factory();
    }

}
