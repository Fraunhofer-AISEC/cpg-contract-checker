pragma solidity ^0.4.0;




contract userPasswd
{
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

    
    function verify(string user, string password) returns (bool) {
        bytes32  sha3_user = sha3(user);
        bytes32  sha3_password = sha3(password);
        

        
        if (userPasswds[sha3_user] == sha3_password){
            RecordReturnResult(true);
            return true;
        }           
        else{
            RecordReturnResult(false);
            return false;
        }
    }

     
    function del(string user) returns (bool) {
        bytes32  sha3_user = sha3(user);

        if (userPasswds[sha3_user] > 0){
           delete userPasswds[sha3_user];
           RecordReturnResult(true);
           return true;
        }
        else {
            RecordReturnResult(false);
            return false;   
        }

    }
      
    function change(string user, string password) returns (bool) {
        bytes32  sha3_user = sha3(user);
        bytes32  sha3_password = sha3(password);

        if (userPasswds[sha3_user] > 0){
           userPasswds[sha3_user] = sha3_password;
           RecordReturnResult(true);
           return true;
        }
        else {
            RecordReturnResult(false);
            return false;
        }                
    }
}
