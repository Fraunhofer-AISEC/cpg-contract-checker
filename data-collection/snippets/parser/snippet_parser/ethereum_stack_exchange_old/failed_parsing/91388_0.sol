Contact Packages
   emit Spend(msg.sender, msg);

   function sendPackage(msg) external payable returns(bool) {
     require(
       msg.value == price,
       'Please send the correct amount of ETH to make send a message'
     );

     emit Spend(msg.sender, msg);
     return true;
}
