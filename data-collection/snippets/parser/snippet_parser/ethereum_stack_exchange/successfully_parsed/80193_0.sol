    struct JediBet {
    uint guess;
    address payable addr;
    BetStatusEnum status;
    uint betAmount;
}


struct Game {
    uint pot;
    uint outcome;
    GameStatusEnum status;
    JediBet originator;
    JediBet taker;
}


event BetStatus (
    GameStatusEnum gameStatus,
    BetStatusEnum originatorStatus,
    address originatorAddress,
    uint originatorGuess,
    address takerAddress,
    BetStatusEnum takerStatus,
    uint takerGuess,
    uint betAmount,
    uint actualNumber,
    uint pot
);


Game game;


function() external payable {}

function resetGame() private {
    
    game.status = GameStatusEnum.STATUS_NOT_STARTED;
    game.outcome = 0;
    game.pot = 0;

    game.originator.guess = 0;
    game.originator.betAmount = 0;
    game.originator.addr = 0;
    game.originator.status = BetStatusEnum.STATUS_UNKNOWN;

    game.taker.guess = 0;
    game.taker.addr = 0;
    game.taker.status = BetStatusEnum.STATUS_UNKNOWN;
}
