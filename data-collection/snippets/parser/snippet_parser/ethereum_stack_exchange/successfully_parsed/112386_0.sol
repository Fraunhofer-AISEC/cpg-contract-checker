struct User {
   bytes32 name;
}

contract Sample {
   mapping(uint32 => User) userById;
   User[] users;
}
