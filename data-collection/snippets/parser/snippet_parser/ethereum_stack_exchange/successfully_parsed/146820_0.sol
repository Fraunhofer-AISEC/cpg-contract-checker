 function createPatientProfile(Patient calldata patientProfileFromProvider) external {
    uint256 length = patientProfileFromProvider.identifier.length;
    for (uint256 i = 0; i < length; i+=1) {
     patientProfiles[msg.sender].identifier.push(patientProfileFromProvider.identifier[i]);
    }
}
