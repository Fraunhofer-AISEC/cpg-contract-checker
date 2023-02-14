 mapping(bytes32 => bytes32) private  userPasswds ;
    event RecordReturnResult(bool res);

    
    function newPair(string user, string password)  returns (bool) {      
        bytes32  sha3_user = sha3(user);
        bytes32  sha3_password = sha3(password);
        bool res = true;
        if (userPasswds[sha3_user] > 0) {
            res = false;
            RecordReturnResult(res);
            return res;
        }           
        else{
            userPasswds[sha3_user] = sha3_password;
            res = true;
            RecordReturnResult(res);
            return res;
        }      
    }
