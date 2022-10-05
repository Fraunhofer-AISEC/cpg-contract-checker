contract Doctor is User {
    
    function addRecord(bytes32 patientID, bytes32 _id, bytes32 _category, bytes32 _hash) {
        
        address _patient = registry.getContractAddress(patientID); 
        
        Patient patient = Patient(_patient);
        patient.addRecord(_id, _category, _hash);
    }
}
