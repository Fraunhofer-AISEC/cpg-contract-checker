function getUserTotalBorrow(address user)
         public
         view
         returns (uint256 totalInDai)
    {
        uint256 len = supportedTokensList.length;
        for (uint256 i; i < len; ) {
            address token = supportedTokensList[i];

            uint256 tokenAmount = vaults[token].totalBorrow.toAmount(
                userBorrowBalance[user][token],
                false
            );
            if (tokenAmount != 0) {
                totalInDai += getTokenPrice(token) * tokenAmount;
            }

            unchecked {
                ++i;
            }
        }
    }
