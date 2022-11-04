function selectWinner() public {
    require(msg.sender==manager);
    require(participants.length>=3);
    uint r=random();  
    uint index=r % participants.length; 
    address payable winner;
    winner=participants[index];
    uint balance = getBalance(); 
    uint fee = balance * 0.01 ether; 
    uint amountToTransfer = balance - fee;
    winner.transfer(amountToTransfer);
    _withdrawFee(fee); 
    participants=new address payable[](0);
}

function _withdrawFee(uint feeAmount) payable private {
    msg.sender.transfer(feeAmount);
}
