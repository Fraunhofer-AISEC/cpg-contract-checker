

pragma solidity ^0.8.19;

contract FPS {
    struct Room {
        address player1;
        address player2;
        bool isFull;
        uint256 winnings;
        bool ended;
        address winner;
    }
 function declareWinner(string memory roomId, address winner)
        external
        onlyOwner
    {
        Room storage room = rooms[roomId];
        require(room.isFull, "Room is not full");
        require(
            winner == room.player1 || winner == room.player2,
            "Winner must be one of the players of this room"
        );
        require(!room.ended, "This room has already ended");
        room.ended = true;
        room.winner = winner;
        uint256 winnerAmount = room.winnings;
        payable(winner).transfer(winnerAmount);
    }

}
