function example(uint256 userId) public {
   User memory user = users[userId];
   
   bool active = user.isActive;
   uint256 age = user.userAge;

   users[userId].isActive = false;
}
