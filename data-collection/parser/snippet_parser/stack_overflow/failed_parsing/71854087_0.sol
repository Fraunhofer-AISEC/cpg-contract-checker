contract MedicalHistory {
    enum Gender {
        Male,
        Female
    }
    uint _patientCount = 0;

    struct Patient {
        string name;
        uint16 age;
        
        
        string telephone;
        string homeAddress;
        uint64 birthday; 
        string disease; 
        uint256 createdAt; 
        Gender gender;
    }

    mapping(uint => Patient) _patients;

    function Register(
        string memory name,
        uint16 age,
        string memory telephone,
        string memory homeAddress,
        uint64 birthday,
        string memory disease,
        
        Gender gender
    }
}
