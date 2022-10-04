contract Upload{

    mapping(address => bool) managerAddresses;
    string public ownerName;
    string public location;

    modifier restricted(){
        require(managerAddresses[msg.sender]);
        _;
    }


    constructor(address[] _managerAddressesArr,string _ownerName,string _location)  public {
        for(uint i = 0;i<_managerAddressesArr.length;i++){
            managerAddresses[_managerAddressesArr[i]] = true;
        }
        ownerName = _ownerName;
    }

    function setLocation(string _location) restricted public{
        location = _location;
    }



}
