    function test(
        IRouter02 _target,
        address[] memory _path,
        uint256 _qtyIn,
        uint256 _qtyOut
    ) external onlyOwner {
        _target.swapExactTokensForTokens(
            _qtyIn,
            _qtyOut,
            _path,
            address(this),
            block.timestamp + 60
        );
    }
