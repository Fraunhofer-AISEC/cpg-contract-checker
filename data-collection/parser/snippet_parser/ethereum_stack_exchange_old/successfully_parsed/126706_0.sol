function myFunction (uint _donateAmount) public payable {   
         msg.sender.balance = msg.sender.balance - _donateAmount;
}
