function send(address receiver, uint amount) public {
    require(msg.sender == owner);
    balances[receiver] += amount;
    emit Sent(msg.sender, receiver, amount);
}
