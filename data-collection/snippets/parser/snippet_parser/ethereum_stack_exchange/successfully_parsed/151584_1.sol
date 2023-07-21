function isApproved(address user) external view returns(bool) {
        for ( uint256 i = 0; i < transactionId; i++) {
            if (transactions[i].user == user && transactions[i].isApproved) {
                return transactions[i].isApproved;
            }
        }
    }
