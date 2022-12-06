    function borrow(
        address token0, address token1, uint256 amount0, uint256 amount1,
        address _factory
    ) external {
        address pairAddress = IUniswapV2Factory(_factory).getPair(
            token0,
            token1
        );
        require(pairAddress != address(0), "This pool does not exist");
        IUniswapV2Pair(pairAddress).swap(
            amount0,
            amount1,
            address(this),
            bytes("asdf")
        );
        require(1 == 0, "asdf");
    }
    function uniswapV2Call(
        address _sender, uint256 _amount0, uint256 _amount1, address _factory,
        bytes calldata _data
    ) external {
         
        require(1==0,"This is called!");
       
    }
}
