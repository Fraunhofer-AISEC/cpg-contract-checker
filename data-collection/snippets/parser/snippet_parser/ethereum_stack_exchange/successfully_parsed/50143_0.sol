


mapping (address => Customer) mcycleowners;
address[] public mcycleownerAdds;


function newMcycleOwner(address _address, string _custname, string _color, string _make, uint32 _year, string _license) onlyMember public {

    Customer storage mcycleowner = mcycleowners[_address];
        mcycleowner.custname = _custname;
        mcycleowner.color = _color;
        mcycleowner.make = _make;
        mcycleowner.year = _year;
        mcycleowner.license = _license;

        mcycleownerAdds.push(_address);

    addLicense(_custname, _color, _make, _year, _license);
}

    function getMcycleAdds() public view returns(address[]) {
        return mcycleownerAdds;
    }

    function getMcycleByAdd(address _address) public view returns(string, string) {
        return (mcycleowners[_address].custname, mcycleowners[_address].license);
    }

    function countMcycle() public view returns(uint) {
        return mcycleownerAdds.length;
    }






mapping (string => Customer) mcyclelicenses;

function addLicense(string _custname, string _color, string _make, uint32 _year, string _license) onlyMember public {
    Customer storage mcyclelicense = mcyclelicenses[_license];
        mcyclelicense.custname = _custname;
        mcyclelicense.color = _color;
        mcyclelicense.make = _make;
        mcyclelicense.year = _year;

}

 function getMcycleByLic(string _license) public view returns(string, string, string, uint32) {
    return (mcyclelicenses[_license].custname, mcyclelicenses[_license].color, mcyclelicenses[_license].make, mcyclelicenses[_license].year);
}
