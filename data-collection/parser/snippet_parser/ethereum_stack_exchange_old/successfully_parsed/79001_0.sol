pragma solidity ^0.5.12;

pragma experimental ABIEncoderV2;

contract AbiTwoTest {

    struct Item {
        string str;
        uint   num;
        bool   bol;
    }

    struct Arg {
        Item[] items;
    }

    mapping (address => Arg) itemsByUser;

    
    event ItemAdded(string indexed str, uint num, bool bol);

    
    function addItem(Item memory _item) public {
        itemsByUser[msg.sender].items.push(_item);
        emit ItemAdded(_item.str, _item.num, _item.bol);
    }

    
    function item(address addr) public view returns (Arg memory items) {
        return itemsByUser[addr];
    }
}
