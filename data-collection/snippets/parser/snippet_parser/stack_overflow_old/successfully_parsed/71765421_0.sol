mapping (address => mapping(uint256=>string)) public message;

    function sendMessage(address _receiver, uint256 _number, string memory _message) public {
        message[_receiver][_number] = _message;
    }
