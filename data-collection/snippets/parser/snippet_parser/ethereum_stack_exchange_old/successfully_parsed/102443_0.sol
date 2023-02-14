pragma solidity ^0.5.0;

contract Agent {
    
    struct patient {
        string name;
        string dob;
        address[] doctorAccessList;
        uint[] diagnosis;
        string record;
    }
    
    struct doctor {
        string name;
        string dob;
        address[] patientAccessList;
    }


    uint creditPool;

    address[] public patientList;
    address[] public doctorList;
    

    mapping (address => patient) patientInfo;
    mapping (address => doctor) doctorInfo;
    
    mapping (address => string) patientRecords;


    function add_agent(string memory _name, string memory _dob, uint _designation, string memory _hash) public {
        address addr = msg.sender;
        
        if(_designation == 0){
            patientInfo[addr].name = _name;
            patientInfo[addr].dob = _dob;
            patientInfo[addr].record = _hash;
            patientList.push(addr)-1;
        }
       else if (_designation == 1){
            doctorInfo[addr].name = _name;
            doctorInfo[addr].dob = _dob;
            doctorList.push(addr)-1;
       }
       else{
           revert();
       }
    }

    function get_patient(address addr) view public returns (string memory, string memory, uint, string memory){
        
        return (patientInfo[addr].name, patientInfo[addr].dob, patientInfo[addr].diagnosis, patientInfo[addr].record);
    }

    function get_doctor(address addr) view public returns (string memory, string memory){
        
        return (doctorInfo[addr].name, doctorInfo[addr].dob);
    }
    function get_patient_doctor_name(address paddr, address daddr) view public returns (string memory, string memory){
        return (patientInfo[paddr].name,doctorInfo[daddr].name);
    }
    function permit_access(address addr) payable public {
        require(msg.value == 2 ether);

        creditPool += 2;
        
        doctorInfo[addr].patientAccessList.push(msg.sender)-1;
        patientInfo[msg.sender].doctorAccessList.push(addr)-1;
        
    }


    
    function insurance_claim(address paddr, uint _diagnosis, string memory _hash) public {
        bool patientFound = false;
        for(uint i = 0;i<doctorInfo[msg.sender].patientAccessList.length;i++){
            if(doctorInfo[msg.sender].patientAccessList[i]==paddr){
                msg.sender.transfer(2 ether);
                creditPool -= 2;
                patientFound = true;
                
            }    
        }
        if(patientFound==true){
            set_hash(paddr, _hash);
            remove_patient(paddr, msg.sender);
        }else {
            revert();
        }

        bool DiagnosisFound = false;
        for(uint j = 0; j < patientInfo[paddr].diagnosis.length;j++){
            if(patientInfo[paddr].diagnosis[j] == _diagnosis)DiagnosisFound = true;
        }  
    }
    
    function remove_element_in_array(address[] storage Array, address addr) internal returns(uint)
    {
        bool check = false;
        uint del_index = 0;
        for(uint i = 0; i<Array.length; i++){
            if(Array[i] == addr){
                check = true;
                del_index = i;
            }
        }
        if(!check) revert();
        else{
            if(Array.length == 1){
                delete Array[del_index];
            }
            else {
                Array[del_index] = Array[Array.length - 1];
                delete Array[Array.length - 1];

            }
            Array.length--;
        }
    }

    function remove_patient(address paddr, address daddr) public {
        remove_element_in_array(doctorInfo[daddr].patientAccessList, paddr);
        remove_element_in_array(patientInfo[paddr].doctorAccessList, daddr);
    }
    
    function get_accessed_doctorlist_for_patient(address addr) public view returns (address)
    { 
        address[] storage doctoraddr = patientInfo[addr].doctorAccessList;
        return doctoraddr;
    }
    function get_accessed_patientlist_for_doctor(address addr) public view returns (address)
    {
        return doctorInfo[addr].patientAccessList;
    }

    
    function revoke_access(address daddr) public payable{
        remove_patient(msg.sender,daddr);
        msg.sender.transfer(2 ether);
        creditPool -= 2;
    }

    function get_patient_list() public view returns(address){
        return patientList;
    }

    function get_doctor_list() public view returns(address){
        return doctorList;
    }

    function get_hash(address paddr) public view returns(string memory){
        return patientInfo[paddr].record;
    }

    function set_hash(address paddr, string memory _hash) internal {
        patientInfo[paddr].record = _hash;
    }

}
