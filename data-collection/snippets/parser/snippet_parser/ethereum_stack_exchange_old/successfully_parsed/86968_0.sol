function takeBet(bet1, team)
    external
    {
    betAmount.push(bet1);
    bettorAddress.push(msg.sender);
    betPick.push(team);
 }
