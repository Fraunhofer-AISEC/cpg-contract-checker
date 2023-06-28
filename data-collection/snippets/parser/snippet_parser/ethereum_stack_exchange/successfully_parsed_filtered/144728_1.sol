function WithdrawFD(unit amount) public payable {
    require(blockedAcc[msg.sender]==false,"You are blocked by the Owner");
    
    
    require(amount >= address(this).balance);
    payable(msg.sender).transfer(amount);
    fdAmount[msg.sender]-=msg.value / 1 ether;
}
