    function transferAmount(address payable _recipient, uint256 _amount)
        public
        payable
    {
        _recipient.transfer(_amount);
    }

    function sendWinnings(string memory winnerTeam) public payable {
        uint256 winnings;
        address payable user;
        for (uint256 i = 0; i < userList.length; i++) {
            if (
                keccak256(abi.encodePacked(winnerTeam)) ==
                keccak256(abi.encodePacked("sab")) &&
                keccak256(abi.encodePacked(winnerTeam)) ==
                keccak256(abi.encodePacked(userStructs[userList[i]].teamChosen))
            ) {
                winnings =
                    (userStructs[userList[i]].potentialWinnings / 100) *
                    99;
                user = payable(userList[i]);
                transferAmount(user, winnings);
            } else {
                winnings =
                    (userStructs[userList[i]].potentialWinnings / 100) *
                    99;
                user = payable(userList[i]);
                transferAmount(user, winnings);
            }
        }
    }
}
