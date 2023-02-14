contract Geekt {
    address[] usersByAddress;  

  function registerNewUser(string handle, bytes32 city, bytes32 state, bytes32 country) public returns (bool success) {
    address newUserAddress = msg.sender;

    usersByAddress.push(newUserAddress);

    return true;
  }

  function getUsers() public constant returns (address[]) {
    return usersByAddress;
  }
}
