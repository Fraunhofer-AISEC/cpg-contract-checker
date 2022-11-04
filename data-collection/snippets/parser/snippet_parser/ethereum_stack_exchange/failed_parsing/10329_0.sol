contract SomeContract {

    
    address public owner = msg.sender; 

    event LogAccessAttempt(address account, string function, uint timestamp); 

    
    function someFunction()
    {
      
      LogAccessAttempt(msg.sender,"someFunction",now);
      
      if (msg.sender !=owner) throw;
      
    }

    
    function changeOwner(address _newOwner)
    {
        LogAccessAttempt(msg.sender,"changeOwner",now);
        
        if (msg.sender !=owner) throw;
        owner = _newOwner;
    }
}
