pragma solidity ^0.4.11;

contract UserBasic {
    struct Record {
        bytes32 _id;
        address _addedBy;
        uint _dateAdded;
        bytes32 _transactionHash;
        bytes32 _type;
        bytes32 _hash;
        bytes32 _signature;
    }
    
    mapping(bytes32 => bytes32[]) typeRecords;
    
    mapping(bytes32 => Record) idRecord;
    
    function addRecord(bytes32 _type, bytes32 _id) {
        typeRecords[_type].push(_id);
        var _new = Record(_id, tx.origin, now, "", _type, "", "");
        idRecord[_id] = _new;
    }
}
