contract ContractB {

    function burn(uint256 _value) public returns (bool success) {
       require(balances[msg.sender] >= _value);   
       balances[msg.sender] -= _value;            
       _totalSupply -= _value;                      
       
       return true;
  }
}
