function () payable {
    if (msg.value == 0) { return; }
    uint256 tokens = msg.value * 100;

    owner.transfer(msg.value);
    balance[msg.sender] += tokens;
}
