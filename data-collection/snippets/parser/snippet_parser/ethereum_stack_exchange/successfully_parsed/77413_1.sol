pragma solidity ^0.5.0; 

contract A {
    struct ItemAddress {
        uint16 ordID;
    }

    ItemAddress[] public itemAddresses;

    function createItemAddress(
        uint16 _ordID
    )
        external
        returns
    (
        uint256 itemAddressID
    )
    {
        ItemAddress memory _itemAddress = ItemAddress({
            ordID: _ordID
        });

        itemAddressID = itemAddresses.push(_itemAddress) - 1;

        return itemAddressID;
    }

    function getItemAddress(uint16 id)
        external
        view
        returns
    (
        uint16 _ordID
    )
    {
        ItemAddress storage itemAddress = itemAddresses[id];

        _ordID = itemAddress.ordID;
    }

    function getItemLength()
        public
        view
        returns (uint256)
    {
        return itemAddresses.length;
    }
}
