pragma solidity >=0.5.0 <0.6.0;

contract Test {
    struct Farmer {
        string name;
        string item;
    }

    struct Item {
        Farmer[] farmers;
        string manufacturerName;
        string manufacturerDate;
        string distributorDataDate;
        string distributorName;
    }

    Farmer[] public globalFarmers;

    function addFarmData(string memory _name, string memory _item) public {
        globalFarmers.push(Farmer(_name, _item));
    }

    function addManufacturerData(
        uint256[] memory _farmerIds,
        string memory _name,
        string memory _date
    ) public {
        Farmer[] memory itemSpecificFarmers = new Farmer[](_farmerIds.length - 1);
        for (uint256 i = 0; i < _farmerIds.length; i++) {
            itemSpecificFarmers[i] = globalFarmers[_farmerIds[i]];
        }
        Item memory item = Item(itemSpecificFarmers, _name, _date, "0", "0");
    }
}
