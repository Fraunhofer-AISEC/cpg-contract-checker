contract Starting { 

    struct itemStatus {
        bool created;
    }
    mapping (bytes => itemStatus) public item;
    
    bool[] public boolArray;    

    function start(bytes memory itemId) public {
        boolArray.push(item[itemId].created);
        if (item[itemId].created) {
            boolArray.push(item[itemId].created);
        } else {
            item[itemId] = itemStatus(true);
            boolArray.push(item[itemId].created);
        }
    }

    function getBoolArray() public view returns (bool[] memory) {
        return boolArray;
    }

}
