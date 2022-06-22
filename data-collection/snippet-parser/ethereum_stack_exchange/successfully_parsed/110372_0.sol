
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

contract Trader is IUniswapV2Callee {
    constructor() public {}

    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external {
        revert("Show me the reason");
    }
}

