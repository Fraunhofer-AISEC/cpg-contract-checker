function addSupplier(string memory _name, uint _phoneNo, string memory
_cityState, string memory _country, string memory _goodsType) public payable returns (bool success)
{

if (bytes(suppliers[msg.sender].name).length == 0 &&
bytes(_name).length != 0) {
    

string memory msg_string = toAsciiString(msg.sender);
    
suppliers[msg.sender].name = _name;
suppliers[msg.sender].phoneNo = _phoneNo;
suppliers[msg.sender].cityState = _cityState;
suppliers[msg.sender].country = _country;
suppliers[msg.sender].goodsType = _goodsType;
suppliers [msg. sender].reputation = track.calculateReputation(msg_string);
suppliersByAddress.push(msg.sender);
return true;
}
else {
return false; 
}
}
