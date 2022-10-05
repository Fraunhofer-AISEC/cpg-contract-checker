function transfer(address _to, uint256 _amount) public returns (bool success) {
    require(_to != address(0));
    require(balances[msg.sender] >= _amount && _amount > 0
        && balances[_to].add(_amount) > balances[_to]);

    
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    Transfer(msg.sender, _to, _amount);
    return true;
  }


contract SomeToken is MintableToken, BurnableToken {
     string public name ;
     string public symbol ;
     uint8 public decimals = 18 ;

     
     function ()public payable {
         revert();
     }

     
     function SomeToken(
            uint256 initialSupply,
            string tokenName,
            string tokenSymbol
         ) public {
         totalSupply = initialSupply.mul( 10 ** uint256(decimals)); 
         name = tokenName;
         symbol = tokenSymbol;
         balances[msg.sender] = totalSupply;

         
         Transfer(address(0), msg.sender, totalSupply);
     }
}
