pragma solidity =0.6.6;

import 'https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Callee.sol';

import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/libraries/UniswapV2Library.sol';
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Factory.sol';
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Exchange.sol';
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router01.sol';
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IERC20.sol';
import 'https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IWETH.sol';

contract ExampleFlashSwap is IUniswapV2Callee {
    IUniswapV1Factory immutable factoryV1;
    address immutable factory;
    IWETH immutable WETH;

    constructor(address _factory, address _factoryV1, address router) public {
        factoryV1 = IUniswapV1Factory(_factoryV1);
        factory = _factory;
        WETH = IWETH(IUniswapV2Router01(router).WETH());
    }

    
    
    receive() external payable {}

    
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external override {
        address[] memory path = new address[](2);
        uint amountToken;
        uint amountETH;
        { 
        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();
        assert(msg.sender == UniswapV2Library.pairFor(factory, token0, token1)); 
        assert(amount0 == 0 || amount1 == 0); 
        path[0] = amount0 == 0 ? token0 : token1;
        path[1] = amount0 == 0 ? token1 : token0;
        amountToken = token0 == address(WETH) ? amount1 : amount0;
        amountETH = token0 == address(WETH) ? amount0 : amount1;
        }

        assert(path[0] == address(WETH) || path[1] == address(WETH)); 
        IERC20 token = IERC20(path[0] == address(WETH) ? path[1] : path[0]);
        IUniswapV1Exchange exchangeV1 = IUniswapV1Exchange(factoryV1.getExchange(address(token))); 

        if (amountToken > 0) {
            (uint minETH) = abi.decode(data, (uint)); 
            token.approve(address(exchangeV1), amountToken);
            uint amountReceived = exchangeV1.tokenToEthSwapInput(amountToken, minETH, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountToken, path)[0];
            assert(amountReceived > amountRequired); 
            WETH.deposit{value: amountRequired}();
            assert(WETH.transfer(msg.sender, amountRequired)); 
            (bool success,) = sender.call{value: amountReceived - amountRequired}(new bytes(0)); 
            assert(success);
        } else {
            (uint minTokens) = abi.decode(data, (uint)); 
            WETH.withdraw(amountETH);
            uint amountReceived = exchangeV1.ethToTokenSwapInput{value: amountETH}(minTokens, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountETH, path)[0];
            assert(amountReceived > amountRequired); 
            assert(token.transfer(msg.sender, amountRequired)); 
            assert(token.transfer(sender, amountReceived - amountRequired)); 
        }
    }
}
