function getPatientRecords(address patientAddress) public view returns(PatientRecord[] memory){

return pAddressToRecord[patientAddress];
}
