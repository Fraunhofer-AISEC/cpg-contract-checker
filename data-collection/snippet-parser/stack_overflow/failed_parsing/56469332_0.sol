pragma solidity ^0.5.0;
contract ItemList {
    uint public itemCount = 0;
    mapping(uint256 => Item) public items;

    event ItemCreated (
        uint id,
        string proofdocument
    );

    struct Item {
        uint id;
        string proofdocument;
    }

    constructor() public {
    }

    function createItem(string memory _proofdocument) public {
        itemCount++;
        items[itemCount] = Item(itemCount, _proofdocument);
        emit ItemCreated(itemCount, _proofdocument);
    }

    function getItems() public pure returns(uint256[] memory ) {
        return items; <----------ERROR
    }
}
