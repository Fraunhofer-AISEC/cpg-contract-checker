
pragma solidity ^0.8.17;

contract Test {
    uint256 mintPrice = 50000000 gwei;

    struct Item {
        uint256 code;
        bool minted;
    }

    struct Category {
        string name;
        Item[] items;
    }

    mapping (string => Category) public categories;

    constructor() {
        
        uint[] memory i = new uint[](3);
        i[0] = 4;
        i[1] = 5;
        i[2] = 9;
        createCategory("Test", i);

        uint[] memory j = new uint[](4);
        j[0] = 121;
        j[1] = 131;
        j[2] = 132;
        j[3] = 141;
        createCategory("Test2", j);
    }

    function createCategory(string memory categoryName, uint[] memory itemIds) public {
        Category storage c = categories[categoryName];
        c.name = categoryName;

        for (uint i = 0; i < itemIds.length; i++) {
            Item memory item = Item(itemIds[i], false);
            c.items.push(item);
        }
    }

    function getCategory(string memory categoryName) public view returns (string memory name, Item[] memory items) {
        Category storage c = categories[categoryName];
        return (c.name, c.items);
    }

    function getUnminted(string memory categoryName) public view returns (uint256 itemId) {
        
        uint256 unmintedItemId;
        Category storage c = categories[categoryName];
        for (uint i = 0; i < c.items.length; i++) {
            if (c.items[i].minted == false) {
                unmintedItemId = c.items[i].code;
                break;
            }
        }
        return unmintedItemId;
    }

    function mint(string memory categoryName) public payable {
        Category storage c = categories[categoryName];
        uint256 unmintedID = getUnminted(categoryName);

        
        require(c.items.length > 0, "Invalid category");

        
        require(unmintedID > 0, "No tokens available");

        
        require(msg.value == mintPrice, "Invalid amount");

        

        
        Item storage currentItem = c.items[unmintedID];  
        currentItem.minted = true;
    }
}
