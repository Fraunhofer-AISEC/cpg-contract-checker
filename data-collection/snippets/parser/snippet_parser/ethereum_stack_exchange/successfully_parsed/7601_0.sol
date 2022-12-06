contract sangalliCoin {

address sangalli;
mapping (address => uint) balances;

modifier sangalliOnly{ if(msg.sender != sangalli) throw; }
event _attemptWithdrawal(uint256 indexed amount, address indexed customer);

function deposit(){
  if(msg.value > 0) balances[msg.sender] += msg.value;
  else throw;
}

function attemptWithdrawal(uint256 amount) returns (string){
  _attemptWithdrawal(amount, msg.sender);
  return "you are probably gonna get ripped off... #sangalliCoin";
}

function setSangalli(){
  sangalli = msg.sender;
}

function withdraw(uint withdrawAmount, address user, uint256 multiple) sangalliOnly public returns (uint remainingBal) {
    if(balances[user] >= withdrawAmount * multiple) {
        balances[user] -= withdrawAmount * multiple;

        if (!user.send(withdrawAmount)) {
            balances[user] += withdrawAmount * multiple;
        }
    }

    return balances[msg.sender];
}

}
