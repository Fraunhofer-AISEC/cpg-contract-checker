
contract Obdrs {

    uint256 dateOfBirth; 
    string gender;
    string fullName;
    string placeOfBirth;
    string motherFullname;
    string motherNrc;
    string fatherFullname;
    string fatherNrc;
    string bo; 
    string permanentAddress;
    string contactNumber;
    

    function storeBirthCertificate(uint256 _dateOfBirth, string calldata _gender, string calldata _fullName, 
    string calldata _placeOfBirth, string calldata _motherFullname, string calldata _motherNrc, string calldata _fatherFullname,
    string calldata _fatherNrc, string calldata _bo, string calldata _permanentAddress, string calldata _contactNumber) public {

        dateOfBirth = _dateOfBirth;
        gender = _gender;
        fullName = _fullName;
        placeOfBirth = _placeOfBirth;
        motherFullname = _motherFullname;
        motherNrc = _motherNrc;
        fatherFullname = _fatherFullname;
        fatherNrc = _fatherNrc;
        b0 = _bo;
        permanentAddress = _permanentAddress;
        contactNumber = _contactNumber;

    }
}```

