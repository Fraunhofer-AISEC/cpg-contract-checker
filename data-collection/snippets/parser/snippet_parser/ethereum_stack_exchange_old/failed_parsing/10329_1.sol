contract SomeContract {

mapping(address => bool) public users;   
users[msg.sender]=true;
modifier guardAndLog(string msg )
        {
            LogAccessAttempt(msg.sender,msg,now);
            if(!users[msg.sender])
               throw
            _;
        }

    function addUser(address _newUser)
    guardAndLog("someone tried to add a user")
    {
       users[_newUser]=true
    }

    function someFunction()
     guardAndLog("someone tried to access someFunction")
    {
    
    }

   }
