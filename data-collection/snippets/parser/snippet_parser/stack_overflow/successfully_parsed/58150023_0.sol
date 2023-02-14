event LoginSuccessful(
        bool success
    );
function Login
        (string memory _password)
        public
    {
        if(keccak256(bytes(users[msg.sender].password)) == keccak256(bytes(_password)))
            emit LoginSuccessful(true);
        else
            emit LoginSuccessful(false);
    }
