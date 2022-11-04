uint256 purchaseCap = (100 * 10**8);


receive() external payable {
    buyTokens(msg.sender);
}


function buyTokens(address _beneficiary) public payable {
    uint256 jagerAmount = msg.value;
    _validatePurchase(_beneficiary, jagerAmount);
    _processPurchase(_beneficiary, jagerAmount);
    _transferBNB(payable(msg.sender), msg.value);
}



function _validatePurchase(address _beneficiary, uint256 _jagerAmount) internal view {
    require(block.timestamp >= startTime && block.timestamp <= endTime, "Crowdsale: current time is either before or after Crowdsale period.");
    require(_hasClosed == false, "Crowdsale: sale is no longer open");
    require(_beneficiary != address(0), "Crowdsale: beneficiary can not be Zero Address.");
    require(_jagerAmount != 0, "Crowdsale: amount of BNB must be greater than 0.");
    require(_jagerAmount <= purchaseCap, "Crowdsale: amount of BNB sent must lower than 100");
    require((balances[_beneficiary] + _jagerAmount) <= purchaseCap, "Crowdsale: amount of BNB entered exceeds buyers purchase cap.");
}
