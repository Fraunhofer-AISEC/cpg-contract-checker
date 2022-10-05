contract A {
function sendtoken() payable returns(bool) {
      require(msg.value!=0);
      require(owner.send(msg.value));
      balances[msg.sender]+= 1;
      balances[owner]-= 1;
      return true;
 }
}
