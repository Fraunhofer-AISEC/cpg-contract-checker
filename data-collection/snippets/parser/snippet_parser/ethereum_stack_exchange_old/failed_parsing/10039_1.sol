struct Item {
    uint ID;
    uint someInt;
    Item[] internalItems;
};
mapping (uint => Item) public Items;
uint public nextID;

uint newID = nextID++;
Items[newID] = new Item(newID, _someInt);
oldItem.internalItems.push(newID);
