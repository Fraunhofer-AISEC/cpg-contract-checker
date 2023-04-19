

require(theUserExists(msg.sender) == false, "User already exists");  
      
require(checkUserExists(msg.sender) == false, "User already exists");

`require(msg.sender|=friend_key, "Users cannot add themselves as friend");` 

 `require(msg.sender != friend_key, "Users cannot add themselves as friend");`

`function checkAlreadyFriend (address pubkey1, address pubkey2) internal view returns(bool);`                     

`function checkAlreadyFriends (address pubkey1, address pubkey2) internal view returns(bool);`

