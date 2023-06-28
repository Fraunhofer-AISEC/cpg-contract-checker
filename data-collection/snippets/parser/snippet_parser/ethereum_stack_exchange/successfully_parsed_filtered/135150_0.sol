pragma solidity >=0.5.0 <0.6.0;
import "./farm.sol";

contract Test {
    struct Item {
        Farmer[] farmers;
        string manufacturerName;
        string manufacturerDate;
        string distributorDataDate;
        string distributorName;
    }

    Farmer[] public globalFarmers;
    Item public Item;

    function addFarmData(string memory _name, string memory _item) public {
        globalFarmers.push(Farmer(_name, _item));
    }

    function addManufacturerData(
        uint256[] memory _farmerIds,
        string memory _name,
        string memory _date
    ) public {
        Farmer[] memory itemSpecificFarmers = new Farmer[](_farmerIds.length - 1);
        for (uint256 i = 0; i < _farmerIds; i++) {
            itemSpecificFarmers[i] = globalFarmers[_farmerIds[i]];
        }
        item = Item(itemSpecificFarmers, _name, _date, "0", "0");
    }
}

