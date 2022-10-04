
    function checkUser(string memory user_id) public view returns(bool){
        if(bytes(PassHash[user_id]).length>0){
            return true;
        }
        else{
            return false;
        }
    }
