 function () external payable {
    buyObject(msg.sender);
}

function buyObject(address _beneficiary) onlyValidPurchase
onlyBuyer(_beneficiary)
onlyValidAddress(_beneficiary) public payable {
    uint numTokens = calculateTokens();
    shopSettings.fundsRaised = shopSettings.fundsRaised.add(msg.value);
    object.mint(_beneficiary, numTokens);
    ObjectPurchase(msg.sender, _beneficiary, msg.value, numTokens);
    forwardFunds();
}
