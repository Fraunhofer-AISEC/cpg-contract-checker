contract Landlord is user {
    string public landlordName;
    string public physicalAddress;
    function Landlord(
        string _name,
        string _physicalAddress){

        landlordName = _name;
        physicalAddress = _physicalAddress;
    }

    function setRent(uint256 _rent, address _tenantAddress){
        Tenant person = Tenant(_tenantAddress);
        person.setRent(uint256 _rent);

    }
