pragma solidity ^0.8;

contract VANET {
    struct Vehicle {
        string name;
        string owner;
        string number;
        string license;
    }
    Vehicle[] private vehicles;

    event VehicleAdded(
        string name,
        string owner,
        string number,
        string license
    );

    function addVehicle(string memory _name, string memory _owner, string memory _number, string memory _license) public {
        vehicles.push(
            Vehicle(_name, _owner, _number, _license)
        );
        emit VehicleAdded(_name, _owner, _number, _license);
    }

    function getVehicles() public view returns (Vehicle[] memory) {
        return vehicles;
    }
}
