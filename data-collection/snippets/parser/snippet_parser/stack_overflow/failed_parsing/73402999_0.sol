function swap(uint tokenAmount, address reciever) public {
    IPancakeRouter02 router = IPancakeRouter02(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3);
    IERC20(spice).approve(address(router), 100e18);
    uint deadline = block.timestamp + 5 minutes;
    router.swapExactTokensForTokens(
        tokenAmount,
        0,
        path2,
        reciever,
        deadline
    );
