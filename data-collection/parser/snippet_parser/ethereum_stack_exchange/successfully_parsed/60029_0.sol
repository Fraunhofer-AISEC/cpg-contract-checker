pragma solidity^0.4.25;

contract PatientRecords {

struct Patient {
    string name;
    string ID;
    uint weight;
    uint height;
}

address doctor;

constructor() public {
    doctor = msg.sender;
}

modifier onlydoctor() {
    if (msg.sender == doctor) {
        _;
    }
} 

Patient[] public patients;

function registerPatient(
    string _name, 
    string _ID, 
    uint _weight, 
    uint _height) public onlydoctor {
        patients.push(Patient(_name, _ID, _weight, _height));
    }
}
