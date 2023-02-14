    function swapEthForDAI(uint256 amount) public returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = uniswap.WETH();
        path[1] = address(DAIToken);
        uint[] memory tokenAmount_;

        
        tokenAmount_ = uniswap.swapExactETHForTokens{value: amount}(
            0,
            path,
            address(this),
            block.timestamp
        );
        uint256 outputTokenCount = uint256(
            tokenAmount_[tokenAmount_.length - 1]
        );
        return outputTokenCount;
    }
