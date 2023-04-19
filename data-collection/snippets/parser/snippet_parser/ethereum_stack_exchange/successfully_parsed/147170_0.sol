function fetchPatientProfile(PatientProfileData storage self, address key) internal view returns (Patient memory) {
    Patient memory patientProfile = self.patientProfiles[key]; 
    return patientProfile;
}
