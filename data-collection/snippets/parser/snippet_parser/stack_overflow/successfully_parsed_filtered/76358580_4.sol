function set_data(string memory _data) public {
    owner=setOwnership(msg.sender);
    require(owner == msg.sender,"You are not the owner of the contract");
    data = _data;
    blocknumber = block.number;
}
