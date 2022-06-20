struct User {
   bytes32 name;
   uint256 age;
   uint256[] friends;
}

contract Sample {
   mapping(uint32 => User) userById;
   User[] users;
}
