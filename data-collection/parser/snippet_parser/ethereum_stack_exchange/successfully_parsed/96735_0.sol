pragma solidity 0.8.0;

contract UserRep {
    mapping(uint256 => User) users;
    uint256[] userIDList;
    
    struct User {
        uint256 id;
        
       
        bool isMalicious;
        uint256 rep_value;
        
    }
    
    event reputationOfUser(uint256 userId, uint256 repVal );

    
    function newUser(uint256 _id) public {
        
        
        users[_id].id = _id;
        users[_id].rep_value = 50;
        
        userIDList.push(users[_id].id);
    }
    
    
    function increaseReputation(uint256 _id, uint256 _addRep) public {
        users[_id].rep_value = users[_id].rep_value + _addRep; 
        
        emit reputationOfUser(users[_id].id, users[_id].rep_value);
    }
    
    
    function decreaseReputation (uint256 _id, uint256 _decRep) public{
        if (users[_id].rep_value < 10){
            users[_id].isMalicious = true;
        }
        users[_id].rep_value = users[_id].rep_value - _decRep;
       
    }
    
    function getUserReputation(uint256 _id) public view returns (uint256){
        return users[_id].rep_value;
    }
    
    function isUserMal(uint256 _id) public view returns (bool){
        if (users[_id].rep_value < 10){
            return true;
        }
        else{
            return false;
        }
    }
    
    function getAllUserIDs() public view returns  (uint256[] memory){
        return userIDList;
    }
    
    function noOfUsers() public view returns  (uint256){
        return userIDList.length;
    }
    

}
