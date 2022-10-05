mapping(address=>User) public users;

function register(string memory _nome) public {
    require(users[msg.sender]==0x0000000000000000000000000000000000000000);
    users[msg.sender] = new User(_nome,msg.sender);
}
