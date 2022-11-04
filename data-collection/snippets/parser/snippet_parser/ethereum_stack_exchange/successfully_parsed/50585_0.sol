function addInventory ( string inventory, bytes32 hashInventory) public {
    inventories[hashInventory] = inventory;
    inventoryHashes.push(hashInventory);
    eventNewInventory(hashInventory);
 }
