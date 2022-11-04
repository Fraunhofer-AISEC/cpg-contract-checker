
pragma solidity ^0.4.25;
contract Index{
    string public message;
    function Inbox(string  _reqstring) public {
        message = _reqstring;
    }
    function setMess(string  _init) public {
        message = _init;
    }

}
