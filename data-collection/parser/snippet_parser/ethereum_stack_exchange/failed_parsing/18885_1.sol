    mapping(bytes32 => bytes32) private  userPasswds ;
    event RecordReturnResult(bool res);bytes32  sha3_user = sha3(user);
    bytes32  sha3_password = sha3(password);
    bool res = true;
