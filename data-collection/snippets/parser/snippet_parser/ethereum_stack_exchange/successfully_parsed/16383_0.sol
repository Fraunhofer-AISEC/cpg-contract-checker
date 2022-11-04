function sendFunds(address receiver, uint amount) onlyOwner {
    if (this.balance < amount) throw;
    receiver.send(amount);
}
