function calculateUnclaimed(address holder) internal returns(uint pending) {
  
  return calculation;
}

function getSpendable(address holder) public constant returns(uint spendable) {
  return balances[holder] + calculateUnclaimed(holder);
}

function processClaim(address holder) public returns(uint newBalance) {
  balances[holder] += calculateUnclaimed(holder);
  zeroOutPending(holder); 
     
     
  return balances[holder];
}
