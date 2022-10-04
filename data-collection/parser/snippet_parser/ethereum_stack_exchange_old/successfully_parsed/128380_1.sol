function example(uint256 userId) public {
   User storage user = users[userId];
   
   bool active = user.isActive;
   uint256 age = user.userAge;

   user.isActive = false;
}
