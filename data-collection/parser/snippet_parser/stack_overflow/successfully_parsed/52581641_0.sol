pragma solidity ^0.4.0;

contract Game {
    struct User{
        address owner;
        uint currency;
        uint left;
        uint right;
        uint top;
        uint bottom;
    }
    User[][10][10] public gameBoard;

    function addUser (uint _x, uint _y) public {
        gameBoard[_x][_y].push(User(msg.sender, 10, 5, 5, 5, 5));
    }

    function moveUser (uint _fromX, uint _fromY, uint _toX, uint _toY) public {
        User memory mover = gameBoard[_fromX][_fromY];
        if (mover.owner != msg.sender)return;

        
        
        
    }

}
