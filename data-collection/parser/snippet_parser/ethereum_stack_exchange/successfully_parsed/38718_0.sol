contract A {
  function sendtoken() payable returns(bool) {
      require(msg.value!=0);
      balances[msg.sender]+= 1;
      balances[owner]-= 1;
      owner.transfer(msg.value);
      return true;
  }
}
