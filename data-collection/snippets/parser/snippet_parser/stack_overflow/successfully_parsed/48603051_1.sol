pragma solidity ^0.4.11;

contract QRCodeTracking {
    struct Location {
        address delegate;
        uint128 longitude;
        uint128 latitude; 
        bytes32 name;
    }

    struct Item {
        bytes32 id;   
        bytes32 name; 
    }

    Item public item;

    Location[] public locations;
    Location public recentLocation;

    function QRCodeTracking(bytes32 id, bytes32 name) public {
        
        locations.length = 100;
        item = Item({id: id, name: name});
    }

    function saveLocation (
        uint128 longitude,
        uint128 latitude,
        bytes32 name
    ) public constant {

        locations.push(Location({
            delegate: msg.sender,
            longitude: longitude,
            latitude: latitude,
            name: name
        }));

    }

    function getLocationHistory(uint idx) constant
        returns (address delegate, uint128 longitude, uint128 latitude, bytes32 name) {

        Location storage loc = locations[idx];

        return (loc.delegate, loc.longitude, loc.latitude, loc.name);
    }

    function getLastLocation() public
        returns (Location recentLocation) {
        recentLocation = locations[locations.length - 1];

        return recentLocation;
    }
}
