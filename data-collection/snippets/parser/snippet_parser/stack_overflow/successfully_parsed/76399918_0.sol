uint256 constant TEN_THOUSAND = 10000;
uint256 constant ONE_YEAR = 31556952;

function _vaultDebtAndFee(uint256 vaultID) internal view returns (uint256, uint256) {
        uint256 currentTime = block.timestamp;
        uint256 debt = accumulatedVaultDebt[vaultID];
        uint256 fee = 0;
        if (lastInterest[vaultID] != 0 && interestRate > 0) {
            uint256 timeDelta = currentTime - lastInterest[vaultID];

            uint256 feeAccrued = (((interestRate * debt) * timeDelta) / ONE_YEAR) / TEN_THOUSAND;
            fee = feeAccrued;
            debt = feeAccrued + debt;
        }
        return (fee, debt);
    }
