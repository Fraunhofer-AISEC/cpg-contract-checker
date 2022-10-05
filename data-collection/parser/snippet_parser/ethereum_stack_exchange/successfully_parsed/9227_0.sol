contract RecordStore{
  struct Record {
    string value;
    address owner;
  }

  mapping(string => Record) records;
  Record lastRecord;

  function addRecord(string _recordId, string _value, address _owner) returns (bool) {
    Record r = records[_recordId];
    r.value = _value;
    r.owner = _owner;
    lastRecord = r;
    return true;
  }

  function getLastRecordOwner() returns (addr) {
    return lastRecord.owner;
  }

}
