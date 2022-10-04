contract Caller
{
    event SendingTransaction(address indexed _requestor, uint8 indexed action);     

    address public minter;
    bytes public email;      

    modifier onlyOwner {
    if (msg.sender != minter)
        throw;
       _;
    }

    function() {
        throw;
    }

    function Caller(bytes _email) {

        
        minter= msg.sender;
        email= _email;
    }

    function proxyRequest(address _target, string _payload) onlyOwner public {

        SendingTransaction(_target, 1);
        

        if (!_target.call("registrationRequest",_target, _payload))
        {
            SendingTransaction(_target, 2);
            
        }
        else
        {
            SendingTransaction(_target, 3);
            
        }


    }

}
