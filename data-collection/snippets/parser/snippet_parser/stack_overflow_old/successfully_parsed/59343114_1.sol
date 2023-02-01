    pragma solidity >=0.4.22 <0.7.0;

contract Inbox{
    string message;

    function _Inbox(string memory _initialMessage) private {
        message =  _initialMessage;    
    }

    function _setMessage(string memory _newMessage) private{
        message = _newMessage;
    }

    function _getMessage() public view returns(string memory){
        return message;
    }
}