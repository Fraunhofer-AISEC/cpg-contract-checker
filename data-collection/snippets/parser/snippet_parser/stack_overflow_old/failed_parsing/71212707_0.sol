    function sellTokens(uint _amount) public {

        uint etherAmount = _amount /rate;

        token.transferFrom(msg.sender, address(this), _amount);

        payable(msg.sender).transfer(etherAmount);


    }
}
