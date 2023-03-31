function doctorNaturalJoinPatient() public view returns(doctorNaturalJoinPatientResult[] memory){
        Doctor doctorContract = Doctor(doctorContractAddress);
        Patient patientContract = Patient(patientContractAddress);

        doctorDetails[] memory dDetails = doctorContract.getRegisteredDoctors();
    }
