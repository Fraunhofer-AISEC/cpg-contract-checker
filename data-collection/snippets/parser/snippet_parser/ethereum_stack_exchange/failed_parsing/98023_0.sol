struct User {
    string name;
    string state;
    uint age;
    string[] recommendations;
    address[] following;
}

mapping(address => User) public users;
mapping(address => bool) userExists;

...

function setup(string memory _name, uint _age, string memory _state) public {
    bytes memory nameBytes = bytes(_name);
    require(nameBytes.length > 0, "Name is empty.");
    users[msg.sender] = User(_name, _state, _age, users[msg.sender].recommendations, users[msg.sender].following);
    userExists[msg.sender] = true;
}
function hasAccount() public view returns (bool) {
    return userExists[msg.sender];
}
