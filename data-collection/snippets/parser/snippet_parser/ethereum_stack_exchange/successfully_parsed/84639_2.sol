function buyExactDaiWithEth() public payable returns(uint256) {
        address cryptoToken = 0xc7AD46e0b8a400Bb3C915120d284AafbA8fc4735;

        uint deadline = now + 15; 
        usi.swapExactETHForTokens.value(msg.value)(0, getPathForETHToToken(cryptoToken), address(this), deadline);

        
        return 1000;
}
