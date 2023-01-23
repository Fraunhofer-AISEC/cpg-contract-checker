balances[msg.sender] -= amount; 
bool success = <address>.send(amount);
if(!success) {
  
  balances[msg.sender] += amount; 
...
