pragma solidity ^0.4.17;
contract EternalStorage {

address owner = msg.sender;
address latestVersion;

mapping(bytes32 => uint) uIntStorage;
mapping(bytes32 => address) addressStorage;

modifier onlyLatestVersion() {
   require(msg.sender == latestVersion);
    _;
}

function upgradeVersion(address _newVersion) public {
    require(msg.sender == owner);
    latestVersion = _newVersion;
}


function getUint(bytes32 _key) external view returns(uint) {
    return uIntStorage[_key];
}

function getAddress(bytes32 _key) external view returns(address) {
    return addressStorage[_key];
}


function setUint(bytes32 _key, uint _value) onlyLatestVersion external {
    uIntStorage[_key] = _value;
}

function setAddress(bytes32 _key, address _value) onlyLatestVersion external  payable{
    addressStorage[_key] = _value;
}


function deleteUint(bytes32 _key) onlyLatestVersion external {
    delete uIntStorage[_key];
}

function deleteAddress(bytes32 _key) onlyLatestVersion external {
    delete addressStorage[_key];
}
}
