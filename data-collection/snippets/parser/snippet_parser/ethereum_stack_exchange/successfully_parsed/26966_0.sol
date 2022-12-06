pragma solidity ^0.4.0;
contract LandTitles {

    struct Title {
        string latitude;
        string longitude;
        string geoAddress;
        string ownerName;
    }
mapping(address => Title) titles;

function first(){

}

function register(string latitudeOfLand, 
                    string longitudeOfLand, 
                    string geoAddressOfLand, 
                    string ownerNameOfLand){
    titles[msg.sender].latitude = latitudeOfLand;
    titles[msg.sender].longitude = longitudeOfLand;
    titles[msg.sender].geoAddress = geoAddressOfLand;
    titles[msg.sender].ownerName = ownerNameOfLand;
}

function getTitle() constant returns(string, string, string, string){
    return (titles[msg.sender].latitude, titles[msg.sender].longitude, titles[msg.sender].geoAddress, titles[msg.sender].ownerName);    

}

function getLatitude() constant returns(string){
    return (titles[msg.sender].latitude);    
}

function getMyAddress() constant returns(string){
    return strConcat(titles[msg.sender].latitude,
            titles[msg.sender].longitude,titles[msg.sender].ownerName);
}


function strConcat(string _a, string _b, string _c, string _d, string _e) constant returns (string){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d);
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
    for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
    return string(babcde);
}

function strConcat(string _a, string _b, string _c, string _d)  constant returns (string) {
    return strConcat(_a, _b, _c, _d, "");
}

function strConcat(string _a, string _b, string _c) constant returns (string) {
    return strConcat(_a, _b, _c, "", "");
}

function strConcat(string _a, string _b) constant returns (string) {
    return strConcat(_a, _b, "", "", "");
}
}
