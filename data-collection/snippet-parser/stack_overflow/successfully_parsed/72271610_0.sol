contract MyContract{
    string name;
    function changeName(string memory newName) public view{
        name = newName;
    }
}
