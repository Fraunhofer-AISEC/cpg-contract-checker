pragma solidity ^0.5.0;

contract PatientDB {
    
    mapping (uint => patient) public patient_db;
    
    struct patient {
        string name;
        string blood;
    }
    
    function addPatient (uint _id, string memory _name, string memory _blood) public {
        patient_db[_id] = patient (_name, _blood);
    }
}
