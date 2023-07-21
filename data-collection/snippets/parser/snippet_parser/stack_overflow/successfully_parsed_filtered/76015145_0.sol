
pragma solidity ^0.8.9;

contract TickTackToe {
    Game[] public games;

    uint256 uniqueGameIndex = 0;

    struct Game {
        address owner;
        address opponent;
        byte[9] board;
        bool isOwnerTurn;
        uint256 game_id;
    }

    function mintGame() public {
        Game memory game = Game(msg.sender, address(0), [0,0,0,0,0,0,0,0,0], true, uniqueGameIndex++);
        games.push(game);
    }

    function join(uint256 gameIdx) public {
        Game storage game = games[gameIdx];
        game.opponent = msg.sender;
    }
}
