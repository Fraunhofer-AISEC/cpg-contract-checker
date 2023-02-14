
pragma solidity ^0.4.0;


contract TicTacToe{


struct Cell {
    uint row;
    uint column;
    address played;
}


struct GameBoard {
    bool gameWon;
    address _player1;
    address _player2;
    Cell[] board;
}

uint private numberOfGames = 0; 
GameBoard[] public _games; 


function getGameNum() public returns(uint){
    return numberOfGames;
}


function newGame() public {
    
    GameBoard tempBoard;
    
    tempBoard._player1 = msg.sender;
    tempBoard._player2 = msg.sender;
    tempBoard.gameWon = false;

    uint counter = 0;
    
    for (uint row = 1; row <= 3; row++) {
        
        for (uint column = 1; column <= 3; column++) {
            tempBoard.board.length++;
            tempBoard.board[counter].row = row;
            tempBoard.board[counter].column = column;
            tempBoard.board[counter].played = 0x0;
            counter++;
        }
    }
}
}
