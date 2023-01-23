function createPatient (uint _SecretNum, string memory _name, uint _dob, string memory _bloodType, string memory _gender, string memory _city,
    string memory allergies,
        bool organDonor,
        string memory emergencyContact) public isWhitelisted(msg.sender)  {


        newPatient[_SecretNum] = patientInfo(_SecretNum, _name, _dob, _bloodType, _gender, _city, allergies,
         organDonor,
        emergencyContact, true);

        emit patientCreate(_SecretNum, _name, _dob, _bloodType, _gender, _city, allergies,
         organDonor,
         emergencyContact, true);
    }
