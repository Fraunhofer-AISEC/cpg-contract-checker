struct Entry {
    bytes32 id;
    uint balance;
    bool used;
}

mapping (address => Entry) public collection;

function AddEntry(bytes32 _id, uint _balance) public {
    require(!collection[msg.sender].used);
    collection[msg.sender] = Entry(_id, _balance, true);
}
