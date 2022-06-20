    function getAccount() external view accountExists returns (uint256, uint256) {
        if (accountData[msg.sender].timeLock < now) {
            uint256 timeRemaining = 0;
        } else {
            timeRemaining = accountData[msg.sender].timeLock - now;
        }
        return (accountData[msg.sender].savings, timeRemaining);
    }
