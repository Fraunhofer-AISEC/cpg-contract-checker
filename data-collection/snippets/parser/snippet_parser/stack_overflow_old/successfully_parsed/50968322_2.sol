function buyTokens(address _beneficiary) public payable {

        uint256 weiAmount = msg.value.mul(rate);

        token.transfer(_beneficiary, weiAmount);

}
