function deposit(address _token, uint256 _value) public {
    require(whitelisted[_token], "Token not whitelisted.");
    require(_value > 0, "Deposit value must be greater than 0.");
    require(msg.sender.call{value: _value}("Transaction failed, check the fallback function, if it's payable or not."));
    userTransactions[msg.sender][_token] = true;
    userTransactionTimestamps[msg.sender][_token] = block.timestamp;
    tokenBalances[msg.sender] += _value;
    userLockedTokens[msg.sender][_token] += _value;
    emit Deposit(msg.sender, _token, _value);
}
