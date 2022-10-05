function () public payable {
    require(now >= startDate && now <= endDate);
    uint tokens;
    if (now <= bonusEnds) {
        tokens = msg.value * 12000;
    } else {
        tokens = msg.value * 10000;
    }
    balances[msg.sender] = safeAdd(balances[msg.sender], tokens);
    _totalSupply = safeAdd(_totalSupply, tokens);
    emit Transfer(address(0), msg.sender, tokens);
    owner.transfer(msg.value);
}
