pragma solidity ^0.4.6;
contract Doctor {
    
    address public owner;
    uint balance;
    
    string public physician;
    
    string public patient_name;
    string public patient_dob;
    string public patient_gender;
    string public patient_problem = '';

    modifier isOwnerPatient {
        require(msg.sender == owner);
        _;
    }

    function Doctor(bytes _name, bytes _dob, bytes _gender, bytes _problems) {
        owner =  msg.sender;
        patient_name = string(_name);
        patient_dob = string(_dob);
        patient_gender = string(_gender);
        patient_problem = string(_problems);
    }

    function updateProblem(bytes _condition) {
        patient_problem = strConcat(patient_problem, string(_condition)); 
    }

    
    function SetPhysician(string _physician) isOwnerPatient {
        physician = _physician;
    }

    function strConcat(string _a, string _b) internal pure returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        string memory abcde = new string(_ba.length + 2 + _bb.length);
        delete abcde;
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        babcde[k++] = ",";
        babcde[k++] = " ";
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        return string(babcde);
    }
}
