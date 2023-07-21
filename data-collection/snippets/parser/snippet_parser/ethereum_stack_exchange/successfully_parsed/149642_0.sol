
pragma solidity ^0.8.0;


contract ItemPlace{

     struct Item {
        bytes32 id;
        string name;
        uint256 price;
        bool isSold;
        address payable seller;
        address payable buyer;
    }
    mapping(bytes32 => Item) public items;
    mapping(bytes32 => bool) public itemAvailable;
    uint256 public itemIndex;

    function generateId(address to, uint256  count) internal  view returns(bytes32){
        return keccak256(abi.encode(address(this), to, count));
    }
    
    function listItem(string memory _name, uint256 _price) public {
        require(bytes(_name).length > 0, "Item name cannot be empty");
        require(_price > 0, "Item price must be greater than 0");
        bytes32 itemId = generateId(msg.sender, itemIndex);

        Item memory newItem = Item(itemId,_name, _price,false,payable(msg.sender),payable(address(0)) );
        items[itemId] = newItem;
        emit ItemListed(generateId(msg.sender, itemIndex), _name, _price, payable(msg.sender));
        itemIndex++;
    }

    function getAllItems() external  view returns (Item[] memory) {
        uint256 itemCount = 0;
        for (uint256 i = 0; i < bytes32(uint256(0) - 1); i++) {
            if (itemAvailable[bytes32(i)]) {
                itemCount++;
            }
        }
        Item[] memory itemList = new Item[](itemCount);
        uint256 j = 0;
        for (uint256 i = 0; i < bytes32(uint256(0) - 1); i++) {
            if (itemAvailable[bytes32(i)]) {
                itemList[j] = items[bytes32(i)];
                j++;
            }
        }
        return itemList;
    }


}
