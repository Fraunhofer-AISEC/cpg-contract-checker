contract ABCToken {
    function sell(uint abcAmount) public {
        uint ethAmount = myFunc(abcAmount);
        msg.sender.transfer(ethAmount);
    }
}
