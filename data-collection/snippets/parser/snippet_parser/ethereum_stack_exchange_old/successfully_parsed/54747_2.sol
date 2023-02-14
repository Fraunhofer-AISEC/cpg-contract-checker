contract ERC20Interface {
  
  function transfer(address _to, uint256 _value) public;
  
  function balanceOf(address _owner) public constant returns (uint256 balance);
}

function flushTokens(address tokenContractAddress) public onlyParent {
    ERC20Interface instance = ERC20Interface(tokenContractAddress);
    var forwarderAddress = address(this);
    var forwarderBalance = instance.balanceOf(forwarderAddress);
    if (forwarderBalance >= 0) {
      return instance.transfer(parentAddress, forwarderBalance);
    }
    
     
    
}
