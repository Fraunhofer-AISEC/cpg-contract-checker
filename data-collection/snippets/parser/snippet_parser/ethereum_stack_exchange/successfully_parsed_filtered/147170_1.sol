function createPatientProfile(Patient calldata profile) external onlyOwner {
    require(patientProfiles.addPatientProfile(profile));
}
