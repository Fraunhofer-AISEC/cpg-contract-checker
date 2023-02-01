contract ex {
   address[] users;
   function addUser() public {
        users.push(msg.sender);
   }

   function returnUsers() constant returns (address[]) {
       return users;
   }
}
