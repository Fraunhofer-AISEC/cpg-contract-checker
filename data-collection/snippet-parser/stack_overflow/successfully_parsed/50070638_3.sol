
    function Will(bytes32 password1, bytes32 password2, uint _deadline) payable {
        deadline = _deadline;
        pass1 = password1;
        pass2 = password2;
        owner = msg.sender;
    }
