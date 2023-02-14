struct Game {
    address host; 
    uint gameId; 
    uint buyinRequirement; 
    uint etherWithdrawalReqs; 
    uint gamePot; 
    uint8 tableWithdrawalReqs; 
    uint8 playerCount; 
    uint8 verifiedWithdrawalReqs; 
    bool endedBuyin; 
    bool isActive; 
    address[] playerList; 
}
