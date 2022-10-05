interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool);
}

contract UniswapExample2 {
    IERC20 private USDC = IERC20(0x2F375e94FC336Cdec2Dc0cCB5277FE59CBf1cAe5);

    function swapTokenForETH() public {
        USDC.transferFrom();
    }
}
