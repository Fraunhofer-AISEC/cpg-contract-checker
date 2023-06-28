  function getLockup(uint32 _serialNo)
        public
        view
        returns (PLibrary.Lockup memory)
    {
        PLibrary.Lockup memory lockInfo = totalLockups[_serialNo];

        if (changeInAPR > 10000) {
            lockInfo.totalAPR += (changeInAPR - 10000);
            lockInfo.dailyRewardPercentage = uint128(
                (lockInfo.totalAPR * (10**8)) / (365 * 3 * 100)
            );
        } else if (changeInAPR < 10000) {
            lockInfo.totalAPR -= (10000 - changeInAPR);
            lockInfo.dailyRewardPercentage = uint128(
                (lockInfo.totalAPR * (10**8)) / (365 * 3 * 100)
            );
        }

        return lockInfo;
    }
