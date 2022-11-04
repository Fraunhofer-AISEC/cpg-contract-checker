   function placeBet(uint8 matchID, string memory bettingType, uint8 oddForWinning) override external payable MBet {
    require(keccak256(abi.encodePacked(bettingType)) == keccak256(abi.encodePacked("Tie")) || keccak256(abi.encodePacked(bettingType)) == keccak256(abi.encodePacked("Team A")) || keccak256(abi.encodePacked(bettingType)) == keccak256(abi.encodePacked("Team B")), "Betting type must be 'Team A' or 'Team B' or 'Tie'");
    bets[msg.sender] = Bet(matchID, bettingType, oddForWinning, msg.value);

    players.push(msg.sender);
  
    string memory b = "Bet received!";
    emit UpdatedBet(msg.sender ,b);

}
