    pragma solidity ^0.4.11;

contract HDataAccessManager {

    mapping (string => string) dataLink;
    mapping (string => string) dataHash;
    mapping (string => bytes32) private passwords; 
    string[] users;


    function _isValid(string _user_id, string _encryption_key_hash) returns (bool) {
        for(uint i = 0;i<users.length;i++){
            if(keccak256(users[i]) == keccak256(_user_id) && 
                keccak256(_encryption_key_hash) == passwords[_user_id]) {

                return true;
            }
        }
        return false;
    }

    function addUser(string _user_id, string _encryption_key_hash) {
        users.push(_user_id);
        passwords[_user_id] = keccak256(_encryption_key_hash);
    }

    function totalUsers() returns (uint) {
        return users.length;
    }


    
    function storeLink(string _user_id, string _link){

        
        

        dataLink[_user_id] = _link;
    }

    function storeHash(string _user_id, string _hash){

        
        

        dataHash[_user_id] = _hash;
    }


    function retrieveLink(string _user_id, string _encryption_key_hash) returns (string, string) {

        
        require(_isValid(_user_id, _encryption_key_hash));

        string link = dataLink[_user_id];
        string hash = dataHash[_user_id];
        return (link, hash);

}

}
