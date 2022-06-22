
contract Sharer {
    function sendHalf(address addr) payable returns (uint balance) {
        require(msg.value % 2 == 0); 
        uint balanceBeforeTransfer = this.balance;
        addr.transfer(msg.value / 2);
        
        
        
        assert(this.balance == balanceBeforeTransfer - msg.value / 2);
        return this.balance;
    }
}
