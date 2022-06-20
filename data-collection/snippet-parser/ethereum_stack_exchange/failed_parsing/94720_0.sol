pragma solidity 0.5;
contract userID{
  struct User {
        uint256 uid;
        bytes32 item;
      }
  mapping (uint256 => User) public  users;
  uint counter = 0;
  function sendReview(uint256 _uid, bytes32 _item) public{
      User storage useritem = users[counter];
      useritem.uid= _uid;
      useritem.item= item;
      counter++;
  }
   function getitem(**uint256 _uid**) public view returns( uint256, bytes32){
       **User storage users._uid**;
      return(users.uid, users.item);
  }
}
