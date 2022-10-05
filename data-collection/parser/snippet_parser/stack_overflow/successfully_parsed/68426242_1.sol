function acceptBattle(uint256 battle_id) public payable{
    Battle storage bate=battleInfo[battle_id];
    require(bate.amountBet>0, "Battle number isn't exist.\n");
    require(bate.creator!=msg.sender, "Impossible to fight against yourself.");
    require(bate.creator==bate.opponent, "This battle is closed, opponent already exist.");
    require(msg.value==bate.amountBet, "Betting value isn't as specified for this battle.");
    bate.opponent=msg.sender;
}
