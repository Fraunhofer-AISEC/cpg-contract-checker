
contract storagex {
    mapping(address => string[]) public users;

    function add(string memory _data) public {
        users[msg.sender].push(_data);
    }

    function retrieve(address ad) public view returns (string[] memory) {
        return users[ad];
    }
}
