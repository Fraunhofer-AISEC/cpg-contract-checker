function () payable public {
    balances[msg.sender] += msg.value;
}
