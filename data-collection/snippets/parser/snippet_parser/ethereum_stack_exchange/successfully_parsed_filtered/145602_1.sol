function createProfile(Profile calldata user) external {
   
   Profile storage profile = profiles[msg.sender];
   
   
   profile.val1 = user.val1;
   profile.val2 = user.val2;

   
   uint256 length = user.identifier.length;
   
   
   for(uint256 i; i < length;) {
      
      profile.identifier.push(user.identifier[i]);
      
      unchecked { ++i; }
   }

}
