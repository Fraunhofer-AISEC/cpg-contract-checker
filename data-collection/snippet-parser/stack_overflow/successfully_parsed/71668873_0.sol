function withdrawFunds(uint amount) public payable returns (bool success) {
    require(balance[msg.sender] >= amount);
    msg.sender.transfer(amount);
    balance[msg.sender] -= amount;
    return success;
}
