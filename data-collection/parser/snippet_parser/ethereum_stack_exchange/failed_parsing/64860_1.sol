address[] users;
mapping(address => address payable) proxy;

...
for (uint i = 0; i < users.length; i++) {
   address payable u = proxy[users[i]];
   u.transfer(<some_value>);
}
