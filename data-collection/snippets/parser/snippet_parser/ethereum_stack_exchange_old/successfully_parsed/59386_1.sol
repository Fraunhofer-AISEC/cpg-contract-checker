contract MyBank {
   mapping (address=>uint) balances;
function Deposit() {
   balances[msg.sender] += msg.value;
}
function Withdraw(uint amount) {
   if(balances[msg.sender] >= amount) {
      msg.sender.send(amount);
      balances[msg.sender] -= amount;
   }
}
function Balance() constant returns(uint) {
   return balances[msg.sender];
 }
}
