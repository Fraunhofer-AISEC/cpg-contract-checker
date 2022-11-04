function swapAllEthForTokens() external {
        swapETHForTokens(address(this).balance);
}
