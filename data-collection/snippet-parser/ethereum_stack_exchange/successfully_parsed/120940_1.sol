
function updateProfile(
    string memory _name,
    GENDER _gender
) public onlyOwner {
    if (bytes(_name).length!=0) {
        patientInfo.name = _name;
    }
    if (_gender!=GENDER.invalid) {
        patientInfo.gender = _gender;
    }
}
