    function giveupStake(uint amount) public payable {
        if (initialStakes[msg.sender] >= amount) {
            initialStakes[msg.sender] -= amount;
            (bool success, ) = payable(msg.sender).call{value: amount}("");
            require(success, "Transfer failed");
        }
    }
