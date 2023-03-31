contract Autopayment {
    
    address  payable recipient = payable(0xBfD0a1880fBd2c45093c974E611Ea0A23031536f);
    uint256 amount = 0.01 ether;

    function sendEth() public payable {
        recipient.transfer(amount);
    }
}
