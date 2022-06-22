contract RoundOracle is Ownable, AccessControl, Pausable {
    uint8 public round; 

    uint8 public constant START = 0;
    uint8 public constant END = 1;

    event LogSetRoundBounds(uint8 round, uint256 startRound, uint256 endRound);

    constructor() {
        round = 1;
    }
}
