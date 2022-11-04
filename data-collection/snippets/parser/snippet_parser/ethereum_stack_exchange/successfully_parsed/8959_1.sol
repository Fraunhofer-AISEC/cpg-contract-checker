pragma solidity ^0.4.0;

contract User {
}

contract Tenant {
    address tenant;
    uint256 rent;

    function Tenant(address _tenant) {
        tenant = _tenant;
    }

    function setRent(uint256 _rent) {
        rent = _rent;
    }
}

contract Landlord is User {
    string public landlordName;
    string public physicalAddress;

    function Landlord(
      string _name,
      string _physicalAddress) {
        landlordName = _name;
        physicalAddress = _physicalAddress;
    }

    function setRent(uint256 _rent, address _tenantAddress){
        Tenant person = Tenant(_tenantAddress);
        person.setRent(_rent);
    }
}    
