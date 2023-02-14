
string[] public coveredCryptocurrencies;


uint public coveragePercentage;


uint public payoutAmount;




uint public crashThreshold;



constructor(
    address _policyHolder,
    string[] memory _coveredCryptocurrencies,
    uint _coveragePercentage,
    uint _crashThreshold
) public {
    policyHolder = _policyHolder;
    coveredCryptocurrencies = _coveredCryptocurrencies;
    coveragePercentage = _coveragePercentage;
    crashThreshold = _crashThreshold;
}




function checkForPayout() public view {
    
    uint marketValue = getMarketValue();

    
    
    if (marketValue < crashThreshold) {
        payoutAmount = marketValue * coveragePercentage / 70;
        policyHolder.notify("Payout triggered! You will receive: " + uint256(payoutAmount);
    }
}



function getMarketValue() private view returns (uint) {
    
    return 0;
}

function withdrawPayout() public {

require(msg.sender == policyHolder, "Only the policy holder can withdraw the payout.");


require(payoutAmount > 0, "No payout is available to withdraw.");


policyHolder.transfer(payoutAmount);


payoutAmount = 0;}
