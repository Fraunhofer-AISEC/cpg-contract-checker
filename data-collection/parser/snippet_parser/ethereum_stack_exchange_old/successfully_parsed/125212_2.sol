function sendCoin(address receiver, uint amount) public {
     require(Owner == msg.sender);
     if (amount > myCoin[msg.sender])
     revert ('Insufficient balance');
     myCoin[msg.sender] -= amount;
     myCoin[receiver] += amount;


     

    if (myCoin[receiver] += amount)
    { 
       emit SuccessfullTransfer(receiver, amount);
    }
}