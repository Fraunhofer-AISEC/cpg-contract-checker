function playGame(bytes32 hashedMove) public returns (bool) {
        require(
            playerOne != address(0x0) && playerTwo != address(0x0),
            "Game needs more players to join first"
        );
        require(
            msg.sender == playerOne || msg.sender == playerTwo,
            "You did not join the game as a player"
        );

        if (msg.sender == playerOne && hashedPlayerOneMove == "") {
            hashedPlayerOneMove = hashedMove;
            emit PlayerMadeMove(playerOne);
        } else if (msg.sender == playerTwo && hashedPlayerTwoMove == "") {
            hashedPlayerTwoMove = hashedMove;
            emit PlayerMadeMove(playerTwo);
        } else {
            return false;
        }

        return true;
    }
