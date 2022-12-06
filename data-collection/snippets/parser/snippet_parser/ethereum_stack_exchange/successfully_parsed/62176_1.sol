contract ABCToken {
    function sell(uint abcAmount) public {
        require(token.transferFrom(msg.sender, address(this), abcAmount)); 
        uint ethAmount = myFunc(abcAmount);
        msg.sender.transfer(ethAmount);
    }
}
