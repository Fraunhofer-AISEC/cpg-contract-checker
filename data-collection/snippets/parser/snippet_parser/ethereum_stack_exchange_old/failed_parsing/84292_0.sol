contract Amortized {

  mapping(address => uint) balances;

  modifier amortizeWork {
     uint c = balanceOf(msg.sender);
     if(balances[msg.sender] != c {
        ??? 
        balances[msg.sender] = c; 
     }
  }

  function balanceOf(address a) public view returns(uint computedBalance) {
    computedBalance = balances[a] + ... 
  }

  function doSomething() public amortizeWork ...
