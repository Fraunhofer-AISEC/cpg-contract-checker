
  function claimBetPayout(uint _betId) external {
    Bet storage bet = bets[_betId];
    Event memory betEvent = events[bet.eventId];

    require(msg.sender == bet.bettor, "Only original bettor address can claim payout");
    require(betEvent.result == bet.option, "Only winning bets can claim payout");
    require(bet.claimed == 0, "Bet payout was already claimed");

    uint payoutAmount = calculateBetPayoutAmount(bet);
    msg.sender.transfer(payoutAmount);

    bet.claimed = 1;
  }
}
