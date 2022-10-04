contract SimpleStorage {
    bytes32[] public items;

    event ItemAdded(bytes32 contents);

    function addItem(bytes32 contents) public returns(bool) {
        items.push(contents);
        emit ItemAdded(contents);
        return true;
    }

    function getAllItems() public constant returns(bytes32[]) {
        return items;
    }
}
