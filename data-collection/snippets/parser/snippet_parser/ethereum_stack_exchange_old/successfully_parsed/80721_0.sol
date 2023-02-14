contract MyContract {
    uint[] public list;

    struct Item {
        bool valid;
        uint index;
        uint value; 
        string name; 
    }

    mapping(uint => Item) public table;

    
    function upsert(uint ID, uint value, string name) external {
        Item storage item = table[ID];
        if (!item.valid) {
            item.valid = true;
            item.index = list.length;
            list.push(ID);
        }
        item.value = value; 
        item.name = name; 
    }

    
    function remove(uint ID) external {
        Item storage item = table[ID];
        require(item.index < list.length);
        require(ID == list[item.index]);
        uint lastItem = list[list.length - 1];
        table[lastItem].index = item.index;
        list[item.index] = lastItem;
        list.length -= 1;
        delete table[ID];
    }

    
    function count() external view returns (uint) {
        return list.length;
    }
}
