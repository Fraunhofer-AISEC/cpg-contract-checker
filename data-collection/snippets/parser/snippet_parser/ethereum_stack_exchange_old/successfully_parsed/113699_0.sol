

function withdraw(uint256 _withdrawAmount) public payable returns (bool) {
    require(_withdrawAmount <= getBalance(), "overdrawn");
    balances[msg.sender] -= _withdrawAmount;
    totalContractBalance -= _withdrawAmount;

    (bool sent, ) = msg.sender.call{value: _withdrawAmount}("");
    require(sent, "Failed to withdraw");

    return true;
}
