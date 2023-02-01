    function userLoop1()
        public
        returns (
            uint256 homePool,
            uint256 awayPool,
            uint256 totalPool
        )
    {
        for (uint256 i = 0; i < userList.length; i++) {
            emit LogUserBet(
                userList[i],
                userStructs[userList[i]].betAmount,
                userStructs[userList[i]].teamChosen,
                userStructs[userList[i]].potentialWinnings
            );
            string memory team = userStructs[userList[i]].teamChosen;
            if (
                keccak256(abi.encodePacked(team)) ==
                keccak256(abi.encodePacked("sab"))
            ) {
                homePool = homePool + userStructs[userList[i]].betAmount;
            } else {
                awayPool = awayPool + userStructs[userList[i]].betAmount;
            }
        }
        totalPool = homePool + awayPool;
        return (homePool, awayPool, totalPool);
    }
