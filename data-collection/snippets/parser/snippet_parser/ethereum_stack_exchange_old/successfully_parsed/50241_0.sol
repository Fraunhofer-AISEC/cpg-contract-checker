pragma solidity ^0.4.18;




contract RegisterContract {

    uint public inventoryWeight;

    mapping(bytes32=>string) public inventories; 
    bytes32[] public inventoryHashes; 
    bytes32[] public inventoryHashesStorage; 

    event eventNewInventory(bytes32 hashInventory);
    event eventNewStorageInventory(bytes32 hashInventory);

    function addInventory ( string inventory, bytes32 hashInventory) public {
        inventories[hashInventory] = inventory;
        inventoryHashes.push(hashInventory);
        eventNewInventory(hashInventory);
     }

     function addInventoryHash(bytes32 hashInventory) public {
         
         
         
         inventoryHashesStorage.push(hashInventory);
         eventNewStorageInventory(hashInventory);
     }

    function getAllInventories() public view returns (bytes32[]) {
        return inventoryHashesStorage;
    }

    function addWeight (uint weight) public {
        inventoryWeight = weight;
    }

    function () payable public {
    }

}
