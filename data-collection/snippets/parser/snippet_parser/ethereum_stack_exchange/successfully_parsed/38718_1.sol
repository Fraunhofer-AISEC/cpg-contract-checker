contract A {
function sendtoken() payable returns(bool) {
      require(msg.value!=0);
      owner.transfer(msg.value);
      balances[msg.sender]+= 1;
      balances[owner]-= 1;
      return true;
 }
}
