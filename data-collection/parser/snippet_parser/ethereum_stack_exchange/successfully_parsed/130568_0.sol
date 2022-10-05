    function appendUserBet(string memory userTeamChosen) public payable {
        uint256 minimumFee = 1 * 10**17 wei;
        userList.push(payable(msg.sender));
        require(msg.value >= minimumFee);
        fee = msg.value;
        userStructs[msg.sender].betAmount += msg.value;
        userStructs[msg.sender].teamChosen = userTeamChosen;
    }
