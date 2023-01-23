function withdrawEther(uint amount, address sendTo) external {
    sendTo.transfer(amount);
    EtherWithdraw(amount, sendTo);
}
