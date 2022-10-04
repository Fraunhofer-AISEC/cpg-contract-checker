function addNewRecord(
    uint256 _clinicId,
    uint256 _patientId,
    string memory _condition,
    string memory _description,
    string memory _allergies,
    string memory _document
) public onlyClinic {   --> error is here "onlyClinic"
    require(patients[_patientId].id != 0, "The patient does not exist");
    Record memory rec = Record(
        recordId,
        _hospitalId,
        _patientId,
        _condition,
        _description,
        _allergies,
        _document
    );
    records[recordId] = rec;
    patients[_patientId].records.push(recordId);
    recordId++;
}
