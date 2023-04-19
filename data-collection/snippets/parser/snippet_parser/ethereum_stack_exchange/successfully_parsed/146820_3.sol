function createPatientProfile(Patient calldata patientProfileFromProvider) external {
    Patient storage userProfile = patientProfiles[msg.sender];
    uint256 length = patientProfileFromProvider.identifier.length;
    for (uint256 i = 0; i < length; i+=1) {
        Identifier storage identifier = userProfile.identifier.push();
        identifier.assigner = patientProfileFromProvider.identifier[i].assigner;
        identifier.period = patientProfileFromProvider.identifier[i].period;
        identifier.system = patientProfileFromProvider.identifier[i].system;
        identifier.use = patientProfileFromProvider.identifier[i].use;
        identifier.value = patientProfileFromProvider.identifier[i].value;
        identifier.type_.text = patientProfileFromProvider.identifier[i].type_.text;
        
        uint256 codingLength = patientProfileFromProvider.identifier[i].type_.coding.length;
        for (uint256 j = 0; j < codingLength; j+=1) {
            identifier.type_.coding.push(Coding(
                patientProfileFromProvider.identifier[i].type_.coding[j].code,
                patientProfileFromProvider.identifier[i].type_.coding[j].display,
                patientProfileFromProvider.identifier[i].type_.coding[j].system,
                patientProfileFromProvider.identifier[i].type_.coding[j].userSelected,
                patientProfileFromProvider.identifier[i].type_.coding[j].version
            ));
        }
    }
}
