contract MetaCoin {
 address owner;

 mapping (address => uint) balances;

 event Transfer(address indexed _from, address indexed _to, uint256 _value);

 function MetaCoin(address caller) {
      owner = caller;
      balances[msg.sender] = 10000; 
 }

 function coinsOwned() returns(uint){
      return balances[this];
 }

 function getOwner() returns(address){
      return owner;
 }

 function sendCoin(address receiver, uint amount) returns(bool sufficient) {
      if (balances[msg.sender] < amount) return false;
      balances[msg.sender] -= amount;
      balances[receiver] += amount;
      Transfer(msg.sender, receiver, amount);
      return true;
 }

 function getBalance(address addr) returns(uint) {
      return balances[addr];
 }

}
