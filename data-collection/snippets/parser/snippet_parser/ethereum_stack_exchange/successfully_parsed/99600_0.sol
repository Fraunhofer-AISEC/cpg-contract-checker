uint public balance;
    
function withdraw(uint amount) public payable {
    require (balance > amount);
    balance -= amount;
    payable(msg.sender).transfer(amount);
}
