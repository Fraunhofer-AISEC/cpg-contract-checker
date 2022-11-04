pragma solidity ^0.4.19;

contract TicTacToe {

    uint8 public boardSize = 3;

    address[3][3] board;

    address public player1;
    address public player2;

    constructor() public {
        player1 = msg.sender;
    }

    function joinGame() public {
        assert(player2 == address(0));
        player2 = msg.sender;
    }

    function setStone(uint8 x, uint8 y) public {
        board[x][y] = msg.sender;
    }

}
