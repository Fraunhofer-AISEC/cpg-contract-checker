function startVoteForChangeBuySellPrice(uint buyPrice, uint buyAddUnits, uint sellPrice, uint sellAddUnits, bool ignoreSecurityLimits) external onlyAdmin
{
    uint sellTotalPrice = sellAddUnits * sellPrice;
    require(voteType == VoteType.NONE);
    require(buyPrice >= sellPrice);
    require(sellTotalPrice <= weiFromExchange);
    voteType = VoteType.CHANGE_BUY_SELL_PRICE;
    voteReturnData[0].uintData = buyPrice;
    voteReturnData[1].uintData = buyAddUnits;
    voteReturnData[2].uintData = sellPrice;
    voteReturnData[3].uintData = sellAddUnits;
    voteReturnData[0].boolData = ignoreSecurityLimits;
    internalResetVotingData();
    voteId = voteId.add(1);
}
