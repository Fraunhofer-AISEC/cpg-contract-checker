
IERC20 Token;
  function buy(uint256 id)
        external
        onlyCardPayable(id, PaymentTypes.Buy)
    {
        uint256 amount;
        if (winners[id][msg.sender].amount == 0) {
            amount = collection[id].amount;
        }
        amount = winners[id][msg.sender].amount;

        distributeTokens(msg.sender, address(this), token, amount);
        transferFrom(address(this), msg.sender, id, 1, "");
        sold += 1;

        emit CardBought(msg.sender, id, PaymentTypes.Buy, amount);
    }
