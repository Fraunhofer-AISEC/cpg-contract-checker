pragma solidity ^0.5.8;

contract DriverRegister {

    enum CarType {mini, micro, prime}

    struct Driver {
        string name;
        uint phno;
        uint licenceno;
        bool isDriverRegistered;
        CarType cartypes;
        uint index;
    }

    mapping(address => Driver) public driverStructs;
    address[] public drivers;

    function registerDriver(string memory _name, uint _phno, uint _licenceno) public {

    }
}
