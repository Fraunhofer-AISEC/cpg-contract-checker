    function divider(
        uint256 numerator,
        uint256 denominator,
        uint256 precision
    ) public pure returns (uint256) {
        return
            ((numerator * (uint256(10)**uint256(precision + 1))) /
                denominator +
                5) / uint256(10);
    }

    function userLoop2() public {
        uint256 homePool;
        uint256 awayPool;
        uint256 totalPool;
        uint256 homePoolShare;
        uint256 awayPoolShare;
        uint256 userShare;
        (homePool, awayPool, totalPool) = userLoop1();
        homePoolShare = divider(homePool, totalPool, 5);
        awayPoolShare = divider(awayPool, totalPool, 5);
        for (uint256 i = 0; i < userList.length; i++) {
            string memory team = userStructs[userList[i]].teamChosen;
            uint256 bet;
            bet = userStructs[userList[i]].betAmount;
            if (
                keccak256(abi.encodePacked(team)) ==
                keccak256(abi.encodePacked(userStructs[userList[i]].teamChosen))
            ) {
                userShare = divider(bet, homePool, 5);
                userStructs[userList[i]].potentialWinnings =
                    (totalPool * userShare) /
                    100000;
            } else {
                userShare = divider(bet, awayPool, 5);
                userStructs[userList[i]].potentialWinnings =
                    (totalPool * userShare) /
                    100000;
            }
            emit LogUserBet(
                userList[i],
                userStructs[userList[i]].betAmount,
                userStructs[userList[i]].teamChosen,
                userStructs[userList[i]].potentialWinnings
            );
        }
    }
