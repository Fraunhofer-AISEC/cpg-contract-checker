function tapGreen(address _receiverAddress) onlySwiper payable public {
    _receiverAddress.transfer(this.balance); 
}
