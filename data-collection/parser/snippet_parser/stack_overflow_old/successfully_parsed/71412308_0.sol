pragma solidity =0.8.12;

import './UniswapV2Library.sol';
import './interfaces/IUniswapV2Router02.sol';
import './interfaces/IUniswapV2Pair.sol';
import './interfaces/IUniswapV2Factory.sol';

contract FlashLoaner {
  address immutable factory;
  IUniswapV2Router02 immutable sushiRouter;
  IUniswapV2Factory immutable factoryV2;
  address public var1;
  address public var2;
  address public resultPair;
  address public resPair2;
  address public fact;

  constructor(address _factory, address _uniRouter, address _sushiRouter) public {
    factory = _factory;
    sushiRouter = IUniswapV2Router02(_sushiRouter);
    factoryV2 = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
  }

  function repl(address _sender, uint _amount0, uint _amount1) external {
      
      address msgsender = 0x052AE8b0F7E5c610937920e46ED265c2063Cb7B8;
      
      IUniswapV2Pair v2Pair = IUniswapV2Pair(msgsender);
      address token0 = v2Pair.token0();
      address token1 = v2Pair.token1();
     
      
      fact = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
      
      
      resultPair = UniswapV2Library.pairFor(fact, token1, token0);
      
      
      
      resPair2 = factoryV2.getPair(token0, token1);
      
  }

  
}


