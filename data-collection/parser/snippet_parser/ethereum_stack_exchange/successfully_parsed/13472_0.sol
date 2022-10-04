pragma solidity ^ 0.4.2;

contract Chat {

    address public user;
    address public myAddress;
    string public message;
    string public response;
    address public owner;
    uint public time;

    function Chat(address _uw, address _a, string _m, string _r) {
        user = _uw;
        myAddress = _a;
        message = _m;
        response = _r;
        owner = msg.sender;
        time = now;
    }

    function getmyAddress() constant returns(address myAddress) {
        return myAddress;
    }

    function getMessage() constant returns(string message) {
        return message;
    }

    function getUser() constant returns(address user) {
        return user;
    }

    function getOwner() constant returns(address owner) {
        return owner;
    }

    function getResponse() constant returns(string response) {
        return response;
    }

    function getTime() constant returns(uint time) {
        return time;
    }    

    function setResponse(string r) {
        if (msg.sender == user) {
            response = r;
        }
    }

}
