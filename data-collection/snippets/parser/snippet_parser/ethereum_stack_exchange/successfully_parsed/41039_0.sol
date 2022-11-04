mapping(address => uint256) public balanceOf

function claimWinnings() returns (bool) {   
    balanceOf[msg.sender] = 20
    withdraw();

    return true;
}

function withdraw() public {
    uint256 balance = balanceOf[msg.sender];  
    balanceOf[msg.sender] -= balance;
    msg.sender.transfer(balance);

    LogWithdrawal(msg.sender, balance);
}    
