struct Item {
    uint256 amt;
    bool isActive;
    address owner;
}
Item[] public items;
function createItem(uint amt) returns(uint a){
   items.push(Item({
      ...
   }))
   return (items.length);
}
