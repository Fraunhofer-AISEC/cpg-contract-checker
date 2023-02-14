pragma solidity ^0.4.21;

    contract ItemsAndUsers {
    struct Item {
        uint id;
        string nameOfItem;
        string typeofItem;
        uint value;
    }

    
    
    struct User {
        address userAddress;
    }

    Item[] public allItems;
    User[] public allUsers;

    mapping (address => uint[]) public userItemsIds;
    mapping (uint => address) public itemIdToUser;

    function createUser() public {
        uint[] memory items;
        User memory user = User({
          userAddress: msg.sender
        });
        allUsers.push(user);
    }

    function createItem(string _name, string _type, uint _value) public {
        Item memory item = Item({
           id: allItems.length,
           nameOfItem: _name,
           typeofItem: _type,
           value: _value
        });
        allItems.push(item);
    }

    function assignItemToUser(address _userAddress, uint _itemId) public {
        itemIdToUser[_itemId] = _userAddress;
        userItemsIds[_userAddress].push(_itemId);
    }

    
    function getUserItems(address _userAddress) public view returns (uint[] items){
        return userItemsIds[_userAddress];
    }

    
    function getItemInfo(uint _itemId) public view returns (uint id, string nameOfItem, string typeofItem, uint value) {
        Item memory item = allItems[_itemId];
        return (item.id, item.nameOfItem, item.typeofItem, item.value);
    }
}
