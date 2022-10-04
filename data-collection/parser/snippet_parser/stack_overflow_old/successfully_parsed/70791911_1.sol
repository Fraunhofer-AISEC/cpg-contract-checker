    function sellTokens(uint256 _value) public {
        require(anteqToken.balanceOf(msg.sender) >= _value, "You doesn't have enought AnteqToken.");
        uint256 etherToSendBack = _value/rate;
        require(address(this).balance >= etherToSendBack, "AnteqToken Swap doesn't have enought Ether to buy yours token.");
        anteqToken.transferFrom(msg.sender, address(this), _value);
        payable(msg.sender).transfer(etherToSendBack);
    }
