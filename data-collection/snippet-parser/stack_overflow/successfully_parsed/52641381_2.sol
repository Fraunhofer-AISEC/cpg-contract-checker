contract StandardToken is ERC20, BasicToken {                                 

  mapping (address => mapping (address => uint256)) internal allowed;         

  function transferFrom(address _from, address _to, uint256 _value)                                                                           
    public returns (bool)
  {                                                                           
    require(_value <= balances[_from]);                                       
    require(_value <= allowed[_from][msg.sender]);  
    require(_to != address(0));                                               

    balances[_from] = balances[_from].sub(_value);                            
    balances[_to] = balances[_to].add(_value);                                
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);      
    emit Transfer(_from, _to, _value);                                        
    return true;                                                              
  }  

}
