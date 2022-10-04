function getPlayerMatchInfo(address account, uint16 _matchSelected) public view returns (uint256, uint16, uint16, uint){
    return (playerInfo[account].amountBet, playerInfo[account].matchSelected, playerInfo[account].resultSelected, playerInfo[account].numFunders);

}
