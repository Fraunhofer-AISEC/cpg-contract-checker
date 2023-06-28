    function addRecord(address _key, string memory password, string memory name) public {
        address[] memory docs;
        medRecords[_key] = MedRecord(password, name, _key, docs);
        recordList.push(_key);
    }
