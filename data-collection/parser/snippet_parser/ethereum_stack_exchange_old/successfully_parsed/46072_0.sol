function waterTree(uint id) public payable {
    trees[id].ethValue += msg.value;
    
}
