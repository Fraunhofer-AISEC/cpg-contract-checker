contract ChatApp {
        struct user{
            bool acceptReq;
            uint nreq;
            address[] requests;
            address[] friends;
        }
        mapping(address  => user)  _users;
            
        function sendreq(address friend) public returns(string memory){
            
            _users[friend].requests[0]=msg.sender;
            return "this function has been executed properly";
        }
}
