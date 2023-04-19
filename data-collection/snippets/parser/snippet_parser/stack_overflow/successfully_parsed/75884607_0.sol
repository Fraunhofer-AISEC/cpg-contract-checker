struct Doctor {
    string doctor_name;
    string doctor_email;
    uint32 d_phone_no;
    uint32 doctor_id;
    bytes32 hash;
}
uint32 doctor_id = 1;

Doctor[] doctor_record;


function AddDoctorRecord(string memory doctor_name, string memory doctor_email, 
uint32 d_phone_no ) public onlyadmin {
    bytes32 _hash = keccak256(abi.encodePacked(msg.sender, block.timestamp, block.difficulty));
    doctor_record.push(Doctor( doctor_name, doctor_email, d_phone_no,doctor_id,_hash));
    doctor_id++;
}

function GetDoctorRecord() public view returns(Doctor[] memory){
    
    return(doctor_record);
    
    
}
