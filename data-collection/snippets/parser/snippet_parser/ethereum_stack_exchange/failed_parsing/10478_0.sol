struct user {
    string name;
    uint id;
    bool valid;
    bytes32 hash_id;
}

mapping (address => user) userRegister;

function clearStruct (address addr) constant returns (bool cleared) {  
   userRegister[addr].name = null;  
   userRegister[addr].id = null;  
   userRegister[addr].valid = null;  
   userRegister[addr].hash_id = null; 
}
