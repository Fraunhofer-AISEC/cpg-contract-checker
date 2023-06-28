
receive() external payable {
    require(msg.value >= ENTRY_COST, "Insufficient BNB sent to enter the draw");

    uint256 entries = msg.value / ENTRY_COST;
    uint256 allowedEntries = entryCount + entries;
    require(allowedEntries <= MAX_ENTRY, "Amount of entries purchased are not available. Please reduce the amount or wait for the next draw!");
        
    for (uint256 i = 0; i < entries; i++) {
        uint256 ticketId = ++entryCount;
        potentialWinners[ticketId] = payable(msg.sender);
        emit addToPotentialWinners(ticketId, msg.sender);
    }

    totalPot += msg.value;

    
    if (entryCount >= MAX_ENTRY) {
        endLottery();
    }
}
