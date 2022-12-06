contract ItemManager {

mapping (address => Item[]) public items;


struct Item {
  string name;
  string description;
  uint256 expiryDate;
}

...


event itemAdded(address user, string name, string description, uint256 exipryDate);

...


function getItems() public view returns (Item [] memory){
   return items[msg.sender];
}



function addItem(string memory name, string memory description, uint256 memory expiryDate) public {

    
    require(bytes(name).length > 0, "name is empty!");

    
    require(bytes(description).length > 0, "description is empty!");

    
    require(bytes(expiryDate).length > 0, "expiryDate is empty!");

    
    Item newItem = Item(name, description, expiryDate);
    items[msg.sender].push(newItem);

    
    emit itemAdded(msg.sender, newItem.name, newItem.description, newItem.expiryDate);
}

...

}
