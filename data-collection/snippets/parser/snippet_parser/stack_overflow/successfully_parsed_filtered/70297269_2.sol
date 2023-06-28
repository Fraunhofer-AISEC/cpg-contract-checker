
contract helloGeeks
{ 
  
  mapping(address => uint) balance;
   
  
 
  function Insert(address _user, uint _amount) public
  {
    
    balance[_user] = _amount
  } 

  
  function View(address _user) public view returns(uint)
  {
    
    return balance[_user];
  } 
}
