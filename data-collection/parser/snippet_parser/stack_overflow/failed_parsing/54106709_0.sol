    struct Round {
        bool isValue;
        uint32 id;
        RoundState state;
        address[] addresses;
        RoundBet[] bets;
        mapping(address => bool) betUsers;
        mapping(address => uint256) userBets;
        uint256 winTicket;
        uint256 amount;
        uint256 lastTicket;
        address winner;
    }
.....

    event roundBet(
        address user,
        uint256 amount,
        uint256 start,
        uint256 end
    );

......
function test() payable public {
        Round storage round = roundsHistory[currentRound];
        require(round.isValue == true);
        require(round.state == RoundState.started);
        require(msg.value >= MIN_BET);
        uint256 amount = msg.value - msg.value % MIN_STEP;
        if(!round.betUsers[msg.sender]){
            round.addresses.push(msg.sender);
            round.betUsers[msg.sender] = true;
        }
        round.userBets[msg.sender] += amount;
        uint256 sticket = round.lastTicket + 1;
        uint256 eticket = sticket + amount;
        uint256 length = round.bets.push(RoundBet(true, sticket, eticket, msg.sender, amount));

        round.amount += amount;
        round.lastTicket = eticket;

        if(round.addresses.length == 2){
            round.state = RoundState.running;
            emit roundTimerStart(currentRound);
        }
        emit roundBet(msg.sender,amount, sticket, eticket);
}
