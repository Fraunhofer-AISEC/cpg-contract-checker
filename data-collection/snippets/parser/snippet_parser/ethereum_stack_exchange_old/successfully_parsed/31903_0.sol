function() payable inTime at_stage(Stages.InProgress) 
active
{
    require(totalTokens <= totalTokensCapMax);

    require(token.isWhiteListed(msg.sender));

    require(msg.value>=minAcceptedAmount);

    totalTokens = safeAdd(totalTokens,safeMul(msg.value, intermedfinalConvRateETH));

    totalEtherContributed = safeAdd(totalEtherContributed,msg.value);

    insertToInvestorsArray(msg.sender);

    investedAmount[msg.sender] = contributor({
      amount:safeAdd(investedAmount[msg.sender].amount,msg.value),
      coin:"ETH"
    });
    beneficiary.send(msg.value);
    Contribution(msg.sender, msg.value, totalTokens);
}
