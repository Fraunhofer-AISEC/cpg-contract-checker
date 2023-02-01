function withdrawRefund(){
    uint refund = refunds[msg.sender];
    refunds[msg.sender] = 0;

    msg.sender.transfer(refund);
}
