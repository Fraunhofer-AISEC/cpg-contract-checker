

pragma solidity 0.8.14;

contract Test {

    enum GameState {UNDEFINED, PENDING, STARTED, CONCLUDED}

    struct Player {
        string name;
        uint[] games;
    }

    struct Game {
        GameState gameState;
        Player player1;
        Player player2;
        uint8 player1Score;
        uint8 player2Score;
    }

    mapping(address => Player) players;
    
    Game[] games;

    
    function getPlayerGameAtIndex(address player, uint gameIndex) public view returns (Game memory game) {
        
        return games[players[player].games[gameIndex]];
    }

    
    function changePlayer(address player, uint gameIndex, address newPlayer) public {
        
        Games storage g = games[players[player].games[gameIndex]];
        if(g.player1 = msg.sender) g.player1 = newPlayer;
        if(g.player2 = msg.sender) g.player2 = newPlayer;

         

    }

}
