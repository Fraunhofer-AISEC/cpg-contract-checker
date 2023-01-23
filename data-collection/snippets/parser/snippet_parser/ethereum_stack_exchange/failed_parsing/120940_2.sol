function updateProfile(
    string memory _name,
) public onlyOwner {
    if (bytes(_name).length > 0) {
        patientInfo.name = _name;
    }
}
