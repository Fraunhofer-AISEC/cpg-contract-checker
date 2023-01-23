 function distributeTokens(
        address from,
        address to,
        IERC20 token,
        uint256 amount
    ) internal {
        uint256 totalShare =
                shares[_charityOne] +
                shares[_charityTwo] +
                shares[_toAddress];
        
        
        token.transferFrom(from, to, amount);
        payable(_charityOne).transfer(amount * (shares[_charityOne] / 100));
        payable(_charityTwo).transfer(amount * (shares[_charityTwo] / 100));
        payable(_toAddress).transfer(amount * (shares[_toAddress] / 100));
    }

