function getRegisteredDoctors() public view returns(DoctorDetails [] memory) {
    DoctorDetails[] memory doctorArray = new DoctorDetails[](doctorAddress.length);
    
    for(uint i = 0; i < doctorAddress.length; i++) {
      doctorArray[i] = doctors[doctorAddress[i]];
    }
    
    return doctorArray;
  }
