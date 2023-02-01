   function updateProfile(
        string memory _name,
        GENDER _gender
    ) public onlyOwner {
        if (_name) {
            patientInfo.name = _name;
        }
 
        if (_gender) {
            patientInfo.name = _gender;
        }
    }
