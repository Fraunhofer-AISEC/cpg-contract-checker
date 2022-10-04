pragma solidity 0.4.19; 

contract Object {

    struct ObjectStruct {
        bytes32 location;
        address owner; 
        bool isObject;
    }

    mapping(bytes32 => ObjectStruct) public objectStructs;
    bytes32[] public objectList;

    event LogNewObject(address sender, bytes32 uid, bytes32 location, address owner);
    event LogChangeObjectLocation(address sender, bytes32 uid, bytes32 newLocation);
    event LogChangeObjectOwner(address sender, bytes32 uid, address newOwner);

    function isObject(bytes32 _uid) public view returns(bool isIndeed) {
        return objectStructs[_uid].isObject;
    }

    function getObjectCount() public view returns(uint count) {
        return objectList.length;
    }

    function newObject(bytes32 _uid, bytes32 _location, address _owner) public returns(bool success) {
        require(!isObject(_uid));
        objectStructs[_uid].location = _location;
        objectStructs[_uid].owner = _owner;
        objectStructs[_uid].isObject = true;
        objectList.push(_uid);
        LogNewObject(msg.sender, _uid, _location, _owner);
        return true;
    }

    function changeObjectLocation(bytes32 _uid, bytes32 _newLocation) public returns(bool success) {
        require(isObject(_uid));
        objectStructs[_uid].location = _newLocation;
        LogChangeObjectLocation(msg.sender, _uid, _newLocation);
        return true;
    }

    function changeObjectOwner(bytes32 _uid, address _newOwner) public returns(bool success) {
        require(isObject(_uid));
        objectStructs[_uid].owner = _newOwner;
        LogChangeObjectOwner(msg.sender, _uid, _newOwner);
        return true;
    }

}
