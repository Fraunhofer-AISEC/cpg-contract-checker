function withdraw() public returns (bool) {
        require(winnerIndex[msg.sender].exists == true, "Not a winner");
        require(prizePerWinner > 0, "Prize not defined");

        delete winners[winnerIndex[msg.sender].index];
        delete winnerIndex[msg.sender];

        payable(msg.sender).transfer(prizePerWinner);

        emit Transfer(address(this), msg.sender, prizePerWinner);

        return true;
    }
