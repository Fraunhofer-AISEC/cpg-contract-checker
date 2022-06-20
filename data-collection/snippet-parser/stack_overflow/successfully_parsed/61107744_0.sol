
struct Record {
    uint _id;
    string _countryCode;
    string _state;
    string _postal;
    string _location;
    string _userId;
    string _additionalDetails;
}
Record[] public records;

function getEntries() public view returns (Record[] memory) {
    return records;
}

function setRecord(
    string memory _countryCode,
    string memory _state,
    string memory _postal,
    string memory _location,
    string memory _userId,
    string memory _additionalDetails
) public onlyOwner {
    Record memory newStruct = Record({
        _id: _counter + 1,
        _countryCode: _countryCode,
        _state: _state,
        _postal: _postal,
        _location: _location,
        _userId: _userId,
        _additionalDetails: _additionalDetails
    });
    records.push(newStruct);
    _counter++;
}
