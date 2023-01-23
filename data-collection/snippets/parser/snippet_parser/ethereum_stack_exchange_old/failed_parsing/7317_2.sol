function getUsers() public view returns(string memory) {
    string memory output="";
    for (uint i = 0; i < users.length; i++) {
        output = string(abi.encodedPack(output,"[", users[i].user_id, ",", users[i].name, ",", users[i].address, ",", users[i].birth_day, "]"));
    }
    return output;
}
