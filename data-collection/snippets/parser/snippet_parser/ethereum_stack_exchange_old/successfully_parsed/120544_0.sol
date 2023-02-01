
receive() external payable {}
    function swapEthForTokens(uint256 ethAmount) public payable returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = uniswapV2Router.WETH();
        path[1] = address(this);

        uint[] memory tokenAmount_ ; 

        
        tokenAmount_ = uniswapV2Router.swapExactETHForTokens{ value: ethAmount }(
            0,
            path,
            address(this), 
            block.timestamp
        );
        uint256 outputTokenCount = uint256(tokenAmount_[tokenAmount_.length - 1]);
        return outputTokenCount;
    }
