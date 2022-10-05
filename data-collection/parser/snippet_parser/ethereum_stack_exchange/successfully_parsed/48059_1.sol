function withdraw() public {
    uint refundAmount = pooledMoney[msg.sender];
    if (refundAmount > 0) {
        pooledMoney[msg.sender] = 0;
        msg.sender.transfer(refundAmount);
        emit Refunded(msg.sender, refundAmount);
    }
}
