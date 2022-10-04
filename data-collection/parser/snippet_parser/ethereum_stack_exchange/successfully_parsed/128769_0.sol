

pragma solidity >=0.7.0 <0.9.0;

contract MoneyVault {
    uint houseMoney; 
    mapping (address => uint) deposits;
    address[] games;

    constructor() {
        Game game = new Game();
        games.push(game);
    }
}

contract Game {
    address currentRound;

    function newRound() public {
        currentRound = new Round(msg.sender);
    }
}

contract Round {
    address player;
    function playerWins() public {
        
    }

    constructor(address _player) {
        player = _player;
    }
}
