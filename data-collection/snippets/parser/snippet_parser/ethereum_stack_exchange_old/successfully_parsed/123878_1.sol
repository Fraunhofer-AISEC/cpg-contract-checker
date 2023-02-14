address winner;
address[] entries;
mapping(address => uint256) deposits;
uint256 TICKET_COST = 1e18;

function enterLottery() public {
    token.transferFrom(msg.sender, address(this), TICKET_COST);
    entries.push(msg.sender);
    deposits[msg.sender] += TICKET_COST;
}

function pickWinner() public requiresRandomNumber whenLotteryOver {
    winner = entries[randomNumber % entries.length];
}

function reclaimTokens() public whenLotteryOver {
    token.transferFrom(address(this), msg.sender, deposits[msg.sender]);
    deposits[msg.sender] = 0;
}
