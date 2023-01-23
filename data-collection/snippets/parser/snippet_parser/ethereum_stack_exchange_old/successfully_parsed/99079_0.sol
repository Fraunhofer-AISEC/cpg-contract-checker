function placeBet(Side _side) public payable {
    require(msg.value > 0, "Sorry we cannot accept Zero values");
    require(ended == false, "Unfortunately accepting bets is over!!");
    bets[_side] += msg.value;
}

    function claim() public {
    require(ended = true, "Game is not over yet sir!");
    uint gain = gamblerBet + (bets[result.LOSER] * gamblerBet / bets[result.WINNER])
    payable(msg.sender).transfer(gain);
    remainingWithdrawal -= 1;
}
