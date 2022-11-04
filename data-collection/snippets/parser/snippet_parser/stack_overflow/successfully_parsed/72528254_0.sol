contract VANET {
    string name;
    string owner;
    string number;
    string license;
    event Vehicle(
        string name,
        string owner,
        string number,
        string license
    );
    function setVehicle(string _name, string _owner, string _number, string _license) public{
        name=_name;
        owner=_owner;
        number=_number;
        license=_license;
        Vehicle(_name, _owner, _number, _license);
    }
    function getVehicle() public constant returns (string, string, string, string){
        return (name, owner, number, license);
    }
}