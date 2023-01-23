     function getPlayerDeposit(address addr) public view returns (uint256[] memory, uint256[] memory, uint256[] memory, uint256[] memory) {
        Deposit[] memory invests = users[addr].deposits;
        uint256[] memory boxIds = new uint256[](invests.length);
        uint256[] memory baseTimes = new uint256[](invests.length);
        uint256[] memory lastCollectedTimes = new uint256[](invests.length);
        uint256[] memory values = new uint256[](invests.length);

        uint256 i = 0;
        while (i < invests.length){
            Deposit memory invest = invests[i];
            boxIds[i] = 0;
            baseTimes[i] = invest.depositTime;
            lastCollectedTimes[i] = invest.lastDepositTime;
            values[i] = invest.amount;
            i++;
        }
        return (boxIds, baseTimes, lastCollectedTimes, values);
    }
