
pragma solidity ^0.8.18;

import "patient.sol";

contract Doctor_Contract is Patient_Contract { 

    

    uint8 doctor_id = 1;

    struct Doctor {
        uint8 doc_id;
        string doctor_name;
        string doctor_email;
        string d_phone_no;
    }

    Doctor[] doctor_record;

    function AddDoctorRecord(string memory doctor_name, string memory doctor_email, 
    string memory d_phone_no ) public onlyadmin {
        doctor_record.push(Doctor(doctor_id,doctor_name, doctor_email, d_phone_no));
        doctor_id++;
    }

    function GetDoctorRecord() public view returns(Doctor[] memory){
        return (doctor_record);
    }
}
