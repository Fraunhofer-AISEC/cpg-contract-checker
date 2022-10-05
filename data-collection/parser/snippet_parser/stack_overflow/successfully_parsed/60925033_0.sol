pragma solidity >=0.4.17;

    contract Inbox {

        string public message;

        constructor(string memory _initMessage) public {
            message = _initMessage;
        }

        function setMessage(string memory _newMessage) public {
            message = _newMessage;
        }
    }
