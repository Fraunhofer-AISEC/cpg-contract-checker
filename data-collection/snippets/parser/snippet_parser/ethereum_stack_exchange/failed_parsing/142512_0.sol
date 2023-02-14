
pragma solidity ^0.8.0; 
contract MedicalKeyEncapsulation {
    address  public Doctor;
    address  public Patient;
    bytes32 private encapA;  
    bytes32 private encapB; 
}

    struct Patientdata{
        string pName;
        uint256 PID;
        uint256 Date;
        string disesaseinfo;
    }

     struct DocRecord{
        string DocName;
        uint256 DID;
        uint256 Date;
        string specialiazation;
        bytes32 hcn_hash;
    }

   

    constructor (address _Patientdata, address _DoctorRecord) public {
    Patient = msg.sender;
    Doctor =_Doctor;
   }
}
