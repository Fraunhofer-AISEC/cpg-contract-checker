contract Patient is User {
    mapping(bytes32 => bytes32[]) category_Records;
    mapping(bytes32 => Record) id_Record;
    
    struct Record {
        bytes32 id;
        bytes32 category;
        address addedBy;
        address addedByContract;
        uint dateAdded;
        bytes32 _hash;
        bool verified;
    }
    
    function addRecord(bytes32 _id, bytes32 _category, bytes32 _hash) {
        Record memory newRecord = Record(_id, _category, tx.origin, msg.sender, now, _hash, false);
        id_Record[_id] = newRecord;
        category_Records[_category].push(_id);
    }
}
