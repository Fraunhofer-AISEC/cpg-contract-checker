contract A {
  mapping (address => uint256) _balances;
  address[] internal _holders;
}

contract B {
  receive () {
     for (let i = 0; i < _holders.length; i++) {
      if (_balances[_holders[i]] > 100) {
         
      }
    } 
  }
}
