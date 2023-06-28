

pragma solidity >=0.7.0 <0.9.0;

contract BirthCertificateStorage {

    uint256 dateOfBirth; 
    string gender;
    string fullName;
    

    function storeBirthCertificate(uint256 _dateOfBirth, string calldata _gender, string calldata _fullName) public {
        dateOfBirth = _dateOfBirth;
        gender = _gender;
        fullName = _fullName;
    }
}
