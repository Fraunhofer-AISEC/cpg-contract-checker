function get() public view returns (string memory, string memory, string memory, string memory, string memory, string memory) {
    return (
        users[msg.sender].name, 
        users[msg.sender].subtitle, 
        users[msg.sender].sdescription, 
        users[msg.sender].ldescription, 
        users[msg.sender].weburl, 
        users[msg.sender].memehash
    );
}
