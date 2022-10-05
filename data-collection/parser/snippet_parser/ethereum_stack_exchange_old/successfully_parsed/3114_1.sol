function getUsersCount() public constant returns(uint) {
    return users.length;
}

function getUser(uint index) public constant returns(uint, string, address) {
    return (users[index].idNum, users[index].name, users[index].userAddress);
}
