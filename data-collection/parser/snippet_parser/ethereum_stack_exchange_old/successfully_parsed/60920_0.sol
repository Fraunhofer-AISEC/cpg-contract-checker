pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract Funding {
    function sum(uint input1, uint input2) public returns (uint) {
        return input1 + input2;
    }

    struct patient{
        uint id;
        string fullName;
        mapping(uint => string[]) DoctorAccess;        
    }

    function getPatient(uint patientId, uint doctorId) public returns (string[]) {
        patient p;
        p.id = 1;
        p.fullName="Saran";
        p.DoctorAccess[doctorId].push("Doctor1Key");
        return p.DoctorAccess[doctorId];
    }
}
