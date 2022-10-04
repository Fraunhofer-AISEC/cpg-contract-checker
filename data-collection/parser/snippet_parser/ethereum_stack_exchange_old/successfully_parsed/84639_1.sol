function buyDaiWithExactEth(uint256 amountOfDai) public payable returns(uint256) {
        address cryptoToken = 0xc7AD46e0b8a400Bb3C915120d284AafbA8fc4735;

        uint deadline = now + 15; 
        usi.swapETHForExactTokens.value(msg.value)(amountOfDai, getPathForETHToToken(cryptoToken), address(this), deadline);

        
        msg.sender.call.value(address(this).balance)("");

        return 1000; 
}

receive() payable external {}
