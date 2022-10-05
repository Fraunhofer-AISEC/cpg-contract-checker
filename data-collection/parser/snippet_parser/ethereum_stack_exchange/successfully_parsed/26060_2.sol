mapping (bytes32 => address) public users;

function AddUser(bytes32 id) public {
    require(users[id] != address(0));
    users[id] = msg.sender;
}
