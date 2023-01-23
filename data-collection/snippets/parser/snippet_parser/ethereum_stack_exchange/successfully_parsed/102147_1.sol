function buyToken(address buyer) public {
    uint purchasedToken = 10;
    transfer(buyer, purchasedToken);
    emit Transfer(theContract, buyer, purchasedToken);
}

receive() external payable {
    uint amount = msg.value;     
    teamWallet.transfer(amount);
}
