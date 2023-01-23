contract Starting { 

    struct itemStatus {
        bool created;
    }
    mapping (bytes => itemStatus) public item;
    
    bool[] public boolArray;    

    function start(bytes memory itemId) public returns (bool[] memory) {
        boolArray.push(item[itemId].created);
        if (item[itemId].created) {
            boolArray.push(item[itemId].created);
            return boolArray;
        } else {
            item[itemId] = itemStatus(true);
            boolArray.push(item[itemId].created);
            return boolArray;
        }
    }
}
