 
    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata data
    ) external override {
        UniswapV3SwapCallbackLocalVars memory vars;

        
        UniswapV3SwapCallbackParams memory params = abi.decode(data, (UniswapV3SwapCallbackParams));

        
        if (msg.sender != poolFor(params.poolKey)) {
            revert FlashUniswapV3__CallNotAuthorized(msg.sender);
        }

        
        vars.mintedHTokenAmount = mintHTokens(...);

        
        vars.repayAmount = uint256(amount0Delta > 0 ? amount0Delta : amount1Delta);

        
        
        if (int256(vars.seizeAmount) < int256(vars.repayAmount) + params.turnout) {
            revert FlashUniswapV3__TurnoutNotSatisfied({
                seizeAmount: vars.seizeAmount,
                repayAmount: vars.repayAmount,
                turnout: params.turnout
            });
        }

        
        if (vars.seizeAmount > vars.repayAmount) {
            unchecked {
                vars.profitAmount = vars.seizeAmount - vars.repayAmount;
            }
            params.collateral.safeTransfer(params.sender, vars.profitAmount);
        }

        
        params.collateral.safeTransfer(msg.sender, vars.repayAmount);
}
