
function get_patient(address addr) view public returns (string memory, string memory, uint[] memory, string memory){
    
    return (patientInfo[addr].name, patientInfo[addr].dob, patientInfo[addr].diagnosis, patientInfo[addr].record);
    }
