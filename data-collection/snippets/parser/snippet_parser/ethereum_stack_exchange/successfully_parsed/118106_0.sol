 function toClaimTotal(address msgsender)public view returns(uint256){
    uint256 rewardsTotal=0;
    for(uint i=0;i<myBets[msgsender].length; i++) {
        uint256 betNumberIterator=getMyBetsUnpaid(msgsender)[i];
        if(betNumberIterator!=666){
            uint256 toBePaidWon;
            uint256 toBePaid;
            uint256 moneyBetted =miseBettersOn[betNumberIterator][Winner[betNumberIterator]][msg.sender];
            uint256 moneyInPoolBefore=moneyInPool[betNumberIterator][Winner[betNumberIterator]];
            toBePaidWon=(moneyBetted*moneyLosedOnBet[betNumberIterator])/moneyInPoolBefore;  
            toBePaid=toBePaidWon+moneyBetted;
            rewardsTotal=rewardsTotal+toBePaid;
        }
    }
    return rewardsTotal;
}
