function addEntry(uint _number) public returns (bool) {
    LinkedList memory object = LinkedList(head,_number);
    bytes32 id = sha3(_number, length, block.timestamp);
    listObjects[id] = object;
    head = id;
    length++; 
}
