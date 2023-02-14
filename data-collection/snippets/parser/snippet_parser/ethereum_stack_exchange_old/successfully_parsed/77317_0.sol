function myBets() public view returns (uint[] memory, bytes32[] memory, bytes32[] memory, int[] memory){
    uint n = betterCacheData[msg.sender].length;

    uint[] memory betValues = new uint[](n);
    bytes32[] memory options = new bytes32[](n);
    bytes32[] memory winStatus = new bytes32[](n);
    int[] memory moneyLineValues = new int[](n);

    for(uint i=0; i<n; i++){
        uint betId = betterCacheData[msg.sender][i].betId;
        uint optionId = betterCacheData[msg.sender][i].optionId;

        betValues[i] = betterCacheData[msg.sender][i].betValue;
        options[i] = bets[betId].moneyLineData[optionId].option;

        if(bets[betId].betStatus == BetStatus.Open || bets[betId].betStatus == BetStatus.Closed){
            winStatus[i] = "pending";
        } else{
            if(bets[betId].correctChoice == optionId){
                winStatus[i] = "won";
                moneyLineValues[i] = bets[betId].moneyLineData[optionId].value;
            } else{
                winStatus[i] = "lost";
            }
        }
    }
    return (betValues, options, winStatus, moneyLineValues);
}
