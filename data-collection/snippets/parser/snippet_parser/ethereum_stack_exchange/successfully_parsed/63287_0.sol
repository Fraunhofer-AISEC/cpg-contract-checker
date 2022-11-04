pragma solidity ^0.5.0;

contract ExampleDataStorage {

struct UserProfile {
    string username;
    string department;
    uint8 avatarNumber;
    uint40 totalSteps;
    mapping(uint32 => uint32) userStepInfo;
    uint32 lastSyncDate;
}

mapping(address => mapping(address => UserProfile)) _userProfile;

function setAvatarNumber(uint8 _avatarNumber, address _userAddress) public {
    _userProfile[msg.sender][_userAddress].avatarNumber = _avatarNumber;
}

function getAvatarNumber(address _contractAddress, address _userAddress) public view returns(uint8) {
    return _userProfile[_contractAddress][_userAddress].avatarNumber;
}

}

contract SharedEvents {

constructor () public {}

event avatarSet(string _contractName, uint8 _avatar);

}


contract UserContract is SharedEvents {

ExampleDataStorage _storage;
string _contractName = "UserContract";

constructor (address _exampleDataStorageAddress) public payable {
    _storage = ExampleDataStorage(_exampleDataStorageAddress);
}

function _setAvatarNumber(uint8 _newAvatarNumber) public {
    _storage.setAvatarNumber(_newAvatarNumber, msg.sender);
    emit avatarSet(_contractName, _newAvatarNumber);
}

function _getAvatarNumber() public view returns(uint8) {
    return _storage.getAvatarNumber(address(this), msg.sender);
}

}


contract OtherContract is SharedEvents {

ExampleDataStorage _storage;
address _userContractAddress;

constructor (address _exampleDataStorageAddress, address _userContractAddressParam) public payable {
    _storage = ExampleDataStorage(_exampleDataStorageAddress);
    _userContractAddress = _userContractAddressParam;
}

function _getAvatarNumber() public view returns(uint8) {
    return _storage.getAvatarNumber(_userContractAddress, msg.sender);
}

}
