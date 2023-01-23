contract Chat
{
    struct User {
        uint40 time;
        address user;
        address myAddress;
        address owner;
        string message;
        string response;
    }

    User public message;

    function Chat(address _uw, address _a, string _m, string _r) 
    {
        message = User ({
            user: _uw,
            myAddress: _a,
            message: _m,
            response:_r,
            owner: msg.sender,
            time: now
            });
    }
}
