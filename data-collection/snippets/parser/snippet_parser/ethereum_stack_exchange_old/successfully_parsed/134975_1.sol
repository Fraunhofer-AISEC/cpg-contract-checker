   function changeUserNameAndEmail (
       bytes32 email,
       bytes32 newName,
       bytes32 newEmail
   ) public {
       uint256 userId = emailToId[email];
       users[userId].name = newName;
       emailToId[newEmail] = userId;
       delete emailToId[email];
   }
